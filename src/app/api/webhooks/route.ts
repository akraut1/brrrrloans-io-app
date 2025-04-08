import { Webhook } from 'svix';
import { headers } from 'next/headers';
import { WebhookEvent } from '@clerk/nextjs/server';
import { NextResponse } from 'next/server';

export async function POST(req: Request) {
  // Get the headers
  const headerPayload = await headers();
  
  // Debug: Log all headers
  console.log('All headers:', Object.fromEntries(headerPayload.entries()));
  
  const svix_id = headerPayload.get("svix-id");
  const svix_timestamp = headerPayload.get("svix-timestamp");
  const svix_signature = headerPayload.get("svix-signature");

  // If there are no headers, error out
  if (!svix_id || !svix_timestamp || !svix_signature) {
    console.error('Missing headers:', { svix_id, svix_timestamp, svix_signature });
    return new Response('Error occured -- no svix headers', {
      status: 400
    });
  }

  // Get the body
  const payload = await req.json();
  const body = JSON.stringify(payload);

  // Create a new Svix instance with your secret.
  const wh = new Webhook(process.env.SIGNING_SECRET || '');

  let evt: WebhookEvent;

  // Verify the payload with the headers
  try {
    evt = wh.verify(body, {
      "svix-id": svix_id,
      "svix-timestamp": svix_timestamp,
      "svix-signature": svix_signature,
    }) as WebhookEvent;
  } catch (err) {
    console.error('Error verifying webhook:', err);
    return new Response('Error occured', {
      status: 400
    });
  }

  // Handle the webhook
  const eventType = evt.type;
  
  // Log the event type for debugging
  console.log('Webhook event type:', eventType);

  // Handle different event types
  switch (eventType) {
    case 'user.created':
      // Handle user creation
      console.log('User created:', evt.data);
      break;
    case 'user.updated':
      // Handle user update
      console.log('User updated:', evt.data);
      break;
    case 'user.deleted':
      // Handle user deletion
      console.log('User deleted:', evt.data);
      break;
    default:
      console.log('Unhandled event type:', eventType);
  }

  return NextResponse.json({ success: true });
} 
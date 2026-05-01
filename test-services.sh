#!/bin/bash

# Test script to verify that all services are working correctly

echo "Testing Minigram services..."

# Start the services
echo "Starting services..."
docker-compose up -d

# Wait for services to start
echo "Waiting for services to start..."
sleep 30

# Test auth service
echo "Testing Auth service..."
AUTH_RESPONSE=$(curl -s -X POST -H "Content-Type: application/json" -d '{"email":"test@example.com","password":"test123"}' -o /dev/null -w "%{http_code}" http://localhost/api/v1/auth/login)
if [ "$AUTH_RESPONSE" == "404" ] || [ "$AUTH_RESPONSE" == "400" ]; then
    echo "✓ Auth service is running (returns expected error code for invalid request)"
else
    echo "✗ Auth service test failed (HTTP $AUTH_RESPONSE)"
fi

# Test profile service
echo "Testing Profile service..."
PROFILE_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/api/v1/profiles)
if [ "$PROFILE_RESPONSE" == "401" ]; then
    echo "✓ Profile service is running (returns 401 for unauthorized access as expected)"
else
    echo "✗ Profile service test failed (HTTP $PROFILE_RESPONSE)"
fi

# Test chats service
echo "Testing Chats service..."
CHATS_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/api/v1/chats)
if [ "$CHATS_RESPONSE" == "401" ] || [ "$CHATS_RESPONSE" == "403" ]; then
    echo "✓ Chats service is running (returns expected error code for unauthorized access)"
else
    echo "✗ Chats service test failed (HTTP $CHATS_RESPONSE)"
fi

# Test frontend service
echo "Testing Frontend service..."
FRONTEND_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)
if [ "$FRONTEND_RESPONSE" == "200" ]; then
    echo "✓ Frontend service is running"
else
    echo "✗ Frontend service test failed (HTTP $FRONTEND_RESPONSE)"
fi

# Stop the services
echo "Stopping services..."
docker-compose down

echo "Test completed."
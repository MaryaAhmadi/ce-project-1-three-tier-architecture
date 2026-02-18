# Test Plan

## Objective
The goal of testing was to validate connectivity, load balancing behavior, and security isolation between tiers.

## Test Scope
The following components were tested:

- ALB accessibility  
- Target group health checks  
- Application response  
- Network isolation  
- Database connectivity  

## Test Methodology

### 1. Health Check Validation
Verified that each application instance responds to `/health` with HTTP 200.

### 2. Load Balancing Test
Sent multiple requests through the ALB and confirmed traffic distribution across instances.

### 3. Security Validation
Confirmed that private instances are not publicly accessible.

### 4. Database Connectivity Test
Verified application can reach the database endpoint.

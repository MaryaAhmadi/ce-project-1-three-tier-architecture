

# Failover Test

## Objective
To verify that the load balancer routes traffic only to healthy instances.

## Test Procedure
1. Stopped Apache on one application instance.
2. Waited for target group health check to mark it unhealthy.
3. Sent traffic through the ALB.

## Observed Behavior
- The unhealthy instance was removed from rotation.
- Traffic continued to be served by healthy instances.
- No downtime observed from client perspective.

## Result
✅ Failover behavior working correctly.

## Notes
Auto Scaling is not yet implemented, which would further improve resilience.

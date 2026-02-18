


# Cost Analysis

## Estimated Monthly Cost
The following table shows the approximate monthly cost of running this architecture in AWS.

| Resource | Estimated Monthly Cost |
|----------|------------------------|
| EC2 (3 x t4g.micro) | ~$15 |
| Application Load Balancer | ~$18 |
| NAT Gateway | ~$32 |
| RDS (db.t4g.micro) | ~$25 |
| **Total** | **~$90/month** |

## Cost Optimization Strategies
Several decisions were made to keep the environment cost-efficient:

- Used small instance types (t4g.micro)  
- Deployed a single NAT Gateway  
- Avoided over-provisioning resources  

## Future Savings Opportunities
- Use Reserved Instances  
- Implement Auto Scaling  
- Consider NAT instance alternative

# Portfolio 5: Distributed and Cloud Database Exercise

## 1. Introduction

This activity examines distributed database concepts using the NovaBank Digital Banking System. MongoDB Atlas was used to demonstrate cloud database deployment and a three-node replica-set configuration.

## 2. Implementation Environment

- Cloud platform: MongoDB Atlas
- Cloud provider: AWS
- Region: Paris (eu-west-3)
- Cluster: NovaBankCluster
- MongoDB version: 8.0.37
- Deployment: Three-node Replica Set
- Database: novabank_nosql

## 3. Practical Exercise

A MongoDB Atlas cluster was created and configured as a three-node replica set. The NovaBank NoSQL database and its customer and transaction collections were deployed on the cluster.

The Atlas deployment provided practical exposure to managed cloud database infrastructure.

## 4. Distributed Database Concepts

The exercise examined:

- Replication and the roles of primary and secondary nodes.
- Automatic failover and database availability.
- Read and write consistency considerations.
- Sharding as a potential approach to scaling database workloads.
- Backup and disaster recovery requirements.

The cluster deployment was verified through the MongoDB Atlas interface. Manual failover and sharding configuration were not performed.

## 5. Conclusion

The exercise demonstrated the deployment of a cloud-hosted database and examined how replica sets support availability and data redundancy. It also highlighted the importance of consistency, scalability, backup and recovery when designing database infrastructure for digital banking systems.

## 6. Evidence

The `evidence` folder contains the MongoDB Atlas cluster deployment screenshot showing the three-node replica-set configuration.

## 7. Supporting Files

- `distributed_architecture.md` — architecture explanation and distributed database design considerations.
#!/bin/bash

echo "Creating replica set..."

mongosh --host localhost:30001 <<EOF
rs.initiate({
    _id : 'rs0',
    members: [
        { _id : 0, host : "mongo1:30001" },
        { _id : 1, host : "mongo2:30002" },
        { _id : 2, host : "mongo3:30003" }
    ]
}, { force: true });
rs.status();
EOF

echo "Replica set created"
sleep 2

echo "Creating user..."
sleep 8

mongosh --host localhost:30001 <<EOF
use admin;
admin = db.getSiblingDB("admin");
admin.createUser({
    user: "$USERNAME",
    pwd: "$PASSWORD",
    roles: [ { role: "root", db: "admin" } ]
});
db.getSiblingDB("admin").auth("$USERNAME", "$PASSWORD");
rs.status();
EOF

echo "User created"

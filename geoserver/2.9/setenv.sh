#export JAVA_OPTS="-XX:PermSize=512m -XX:MaxPermSize=1024m"
#JAVA_OPTS="-Xms512m -Xmx2048m -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=1024m" export
#JAVA_OPTS="-Xms1024m -Xmx4096m -XX:SoftRefLRUPolicyMSPerMB=36000 -XX:+UseParallelGC -XX:+UseParNewGC -XX:+UseG1GC"
JAVA_OPTS="-Xms1024m -Xmx6144m -XX:SoftRefLRUPolicyMSPerMB=36000 -XX:+UseG1GC -XX:+UseStringDeduplication"

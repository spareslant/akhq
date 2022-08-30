# List all kafka topics
kafka-topics --bootstrap-server 127.0.0.1:9092 --list

# Add a local kafka user admin123 and allow all operations on all Topics
kafka-acls --bootstrap-server 127.0.0.1:9092  --add --allow-principal User:admin123 --allow-host All --operation All --topic All

# Dump entire ldap tree (while logged in ldap server itself)
slapcat
ldapsearch  -H ldap://localhost:389  -D 'cn=admin,dc=bogus,dc=company' -b 'dc=bogus,dc=company' -w 'admin'
ldapsearch  -H ldap://localhost:389  -D 'cn=admin,dc=bogus,dc=company' -b 'dc=bogus,dc=company' -w 'admin' 'objectClass=posixGroup'

# Gen user ldif files
cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="aUser1" -userid="10030" -gid="5001" > 22_auser1.ldif

cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="aUser2" -userid="10031" -gid="5001" > 23_auser2.ldif

cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="aUser3" -userid="10032" -gid="5002" > 24_auser3.ldif

cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="aUser4" -userid="10033" -gid="5002" > 25_auser4.ldif

cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="bUser1" -userid="10034" -gid="5003" > 26_buser1.ldif

cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="bUser2" -userid="10035" -gid="5003" > 27_buser2.ldif 

cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="bUser3" -userid="10036" -gid="5004" > 28_buser3.ldif

 cat user.ldif.template | perl -s -wpl -e 's!\<user\>!$user!; s!\<User\>!\U$user!; s!\<userid\>!$userid!; s!\<gid\>!$gid!' -- -user="bUser4" -userid="10037" -gid="5004" > 9_buser4.ldif



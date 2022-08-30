# AKHQ configuration

## What it does:
* This repo will spin-up a kafka, zookeeper, schema-registry, ldap server and AKHQ instance using docker-compose
* This will also populate a some test data and with some topics.
   * `aTopic`
   * `bTopic`
* ldap will have users. Some of them are below
   * `aUser1` => `Group: aTopicDevs`
   * `aUser2` => `Group: aTopicDevs`
   * `aUser3` => `Group: aTopicDevsAll`
   * `aUser4` => `Group: aTopicDevsAll`
* `aUser1` and `aUser2` will have just `read` permissions on topic `aTopic`.
* `aUser3` and `aUser4` will have both `read` and `config` permissions on topic `aTopic`.
* Creates a local user `admin123` with password `admin123` having all the permissions on kafka resources.
* Makes ldap user `admin` with pasword `admin` having all the permissions on kafka resources.

## How to Bring it up:
* `docker-compose up`

### Check status of containers
* `docker-compose ps`
Note: if `test-data` container may not run successully and may exit (in above command output), then start is again using following command
* `docker-compose up test-data`
Note: `docker-compose up` command will attach to your current terminal. Use `docker-compose up -d` to detach the terminal.
* `test-data` container creates `aTopic` and `bTopic` topics.

## How to verify
* Open URL `http://localhost:8080` in your browser.
* Use above mentioned super users `admin`(ldap account) and `admin123`(local account) (their passwords are different) to login and make sure you can see `aTopic` and `bTopic` topics.
* Login with `aUser1` and `aUser2` accounts (ldap accounts). These users will be able to see just `aTopic`. These will not be able to modify its configurations. Whereas `aUser3` and `aUser4` will be able to both read and modify configuration for `aTopic`.
* `bUser1` and `bUser2` will not be able to login.
Note: Password for above users are in `scripts/security/ldap_users` folder.

## How to teardown
* `docker-compose down`
* `docker volume rm $(docker volume ls -q)`

## Note:
* Code in this repo is taken from following links
   * https://raw.githubusercontent.com/tchiotludo/akhq/master/docker-compose.yml
   * https://github.com/tchiotludo/akhq/blob/dev/application.example.yml
   * https://github.com/confluentinc/cp-demo`
* Kafka is not configured to use SSL in this repo.

## Other useful links
* https://akhq.io/docs/debug.html#debugging-authentication

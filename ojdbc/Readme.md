# Oracle JDBC

> 上传jar到Maven仓库

```bash
mvn deploy:deploy-file -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar -Dfile=ojdbc7.jar -Durl=http://svn.shawnyan.com:8081/repository/shawn-release -DrepositoryId=releases
```

> 在pom.xml中引入依赖

```xml
    <dependency>      
      <groupId>com.oracle</groupId>      
      <artifactId>ojdbc7</artifactId>      
      <version>12.1.0.2</version>
    </dependency>
```

## REF

- [Oracle8i JDBC Drivers](http://www.oracle.com/technetwork/database/enterprise-edition/jdbc817-100207.html)
- [Oracle JDBC Drivers release 10.2.0.1.0](http://www.oracle.com/technetwork/database/enterprise-edition/readme-10201-097623.html?ssSourceSiteId=otncn)
- [Oracle Database 11g Release 2 JDBC Drivers](http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html)
- [Oracle Database 12.1.0.1 JDBC Driver & UCP Downloads](http://www.oracle.com/technetwork/database/features/jdbc/jdbc-drivers-12c-download-1958347.html)


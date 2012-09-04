dataSource {
  pooled = true
  driverClassName = "com.mysql.jdbc.Driver"
  username = "adminvest"
  password = "admin#vest"
}
hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = "net.sf.ehcache.hibernate.EhCacheProvider"
}

// environment specific settings
environments {
  development {
    dataSource {
      username = "eventos"
      password = "eventos"
      dbCreate = "update" // one of 'create', 'create-drop','update'
      url = "jdbc:mysql://localhost:3306/eventos"
    }
  }
  test {
    dataSource {
      dbCreate = "update"
      url = "jdbc:mysql://187.33.255.17:4406/eventos"
    }
  }
  production {
    dataSource {
      dbCreate = "update"
      url = "jdbc:mysql://187.33.255.17:4406/eventos"
    }
  }
}
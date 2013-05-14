databaseChangeLog = {
	changeSet(author: "brunocatao (generated)", id: "1365775166820-1") {
	  addColumn(tableName: "mini_curso") {
	    column(name: "total_de_vagas", type: "INT", defaultValue: 0) {
	      constraints(nullable: "true")
	    }
	  }
	}
}

databaseChangeLog = {

	changeSet(author: "brunocatao (generated)", id: "1346251251118-1") {
		dropNotNullConstraint(columnDataType: "longtext", columnName: "css", tableName: "evento")
	}

	changeSet(author: "brunocatao (generated)", id: "1346251251118-2") {
		modifyDataType(columnName: "imagem", newDataType: "longblob(255)", tableName: "imagem")
	}

	changeSet(author: "brunocatao (generated)", id: "1346251251118-3") {
		modifyDataType(columnName: "image", newDataType: "longblob(255)", tableName: "thumbnail")
	}

	changeSet(author: "brunocatao (generated)", id: "1346251251118-4") {
		dropForeignKeyConstraint(baseTableName: "evento", baseTableSchemaName: "eventos", constraintName: "FKB307E1152912C92B")
	}
}

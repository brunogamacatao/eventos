databaseChangeLog = {

	changeSet(author: "brunocatao (generated)", id: "1346250881405-1") {
		createTable(tableName: "baixa") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "data_pagamento", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "observacao", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "titulo_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "usuario_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "valor_pago", type: "DOUBLE") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-2") {
		createTable(tableName: "bi_images") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "data", type: "LONGBLOB") {
				constraints(nullable: "false")
			}

			column(name: "type", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-3") {
		createTable(tableName: "configuracao") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "agencia", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "banco", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "carteira", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "conta", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "convenio", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "operacao", type: "INT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-4") {
		createTable(tableName: "curso") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "evento_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "nome", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "tipo", type: "VARCHAR(10)") {
				constraints(nullable: "false")
			}

			column(name: "vagas", type: "INT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-5") {
		createTable(tableName: "evento") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "configuracao_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "css", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "data", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "data_termino", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "desconto", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "identificador", type: "VARCHAR(255)")

			column(name: "local", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "logomarca_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "nome", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "status", type: "VARCHAR(10)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-6") {
		createTable(tableName: "grupo") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-7") {
		createTable(tableName: "imagem") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "altura", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "imagem", type: "LONGBLOB") {
				constraints(nullable: "false")
			}

			column(name: "imagem_original_id", type: "BIGINT")

			column(name: "largura", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "nome_arquivo", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-8") {
		createTable(tableName: "opcao") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "curso_id", type: "BIGINT")

			column(name: "data_termino", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "descricao", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "evento_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "preco", type: "DOUBLE") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-9") {
		createTable(tableName: "opcao_resposta") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "descricao", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "pergunta_id", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-10") {
		createTable(tableName: "pergunta") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "ordem", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "questionario_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "tipo", type: "VARCHAR(10)") {
				constraints(nullable: "false")
			}

			column(name: "titulo", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-11") {
		createTable(tableName: "pessoa") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "bairro", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "cep", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "cidade", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "cidade_naturalidade", type: "VARCHAR(255)")

			column(name: "complemento", type: "VARCHAR(255)")

			column(name: "cpf", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "data_nascimento", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "endereco", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "estado", type: "VARCHAR(19)") {
				constraints(nullable: "false")
			}

			column(name: "estado_civil", type: "VARCHAR(10)") {
				constraints(nullable: "false")
			}

			column(name: "estado_naturalidade", type: "VARCHAR(19)") {
				constraints(nullable: "false")
			}

			column(name: "estadorg", type: "VARCHAR(19)") {
				constraints(nullable: "false")
			}

			column(name: "nacionalidade", type: "VARCHAR(11)") {
				constraints(nullable: "false")
			}

			column(name: "nome", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "numero", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "orgao_emissor", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "pais", type: "VARCHAR(255)")

			column(name: "rg", type: "VARCHAR(255)")

			column(name: "sexo", type: "VARCHAR(9)") {
				constraints(nullable: "false")
			}

			column(name: "telefone1", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "telefone2", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "comprovante_id", type: "BIGINT")

			column(name: "socio", type: "VARCHAR(3)")
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-12") {
		createTable(tableName: "questionario") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "evento_id", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-13") {
		createTable(tableName: "resposta") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "participante_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "pergunta_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "resposta", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-14") {
		createTable(tableName: "thumbnail") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "filename", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "height", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "image", type: "LONGBLOB") {
				constraints(nullable: "false")
			}

			column(name: "parent_image_id", type: "BIGINT")

			column(name: "width", type: "INT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-15") {
		createTable(tableName: "titulo") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "data_vencimento", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "linha_digitavel", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "nosso_numero", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "valor", type: "DOUBLE") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-16") {
		createTable(tableName: "usuario") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "password", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-17") {
		createTable(tableName: "usuario_grupo") {
			column(name: "grupo_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "usuario_id", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-18") {
		addPrimaryKey(columnNames: "grupo_id, usuario_id", tableName: "usuario_grupo")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-19") {
		addForeignKeyConstraint(baseColumnNames: "titulo_id", baseTableName: "baixa", baseTableSchemaName: "eventos", constraintName: "FK592B0735C8C612A", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "titulo", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-20") {
		addForeignKeyConstraint(baseColumnNames: "usuario_id", baseTableName: "baixa", baseTableSchemaName: "eventos", constraintName: "FK592B07389C586EA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "usuario", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-21") {
		addForeignKeyConstraint(baseColumnNames: "evento_id", baseTableName: "curso", baseTableSchemaName: "eventos", constraintName: "FK5AA009CB51213AA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "evento", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-22") {
		addForeignKeyConstraint(baseColumnNames: "configuracao_id", baseTableName: "evento", baseTableSchemaName: "eventos", constraintName: "FKB307E1158AA0496A", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "configuracao", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-23") {
		addForeignKeyConstraint(baseColumnNames: "logomarca_id", baseTableName: "evento", baseTableSchemaName: "eventos", constraintName: "FKB307E1152912C92B", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "imagem", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-24") {
		addForeignKeyConstraint(baseColumnNames: "logomarca_id", baseTableName: "evento", baseTableSchemaName: "eventos", constraintName: "FKB307E115E111A5C3", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "thumbnail", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-25") {
		addForeignKeyConstraint(baseColumnNames: "imagem_original_id", baseTableName: "imagem", baseTableSchemaName: "eventos", constraintName: "FKB95A82723D9B487E", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "imagem", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-26") {
		addForeignKeyConstraint(baseColumnNames: "curso_id", baseTableName: "opcao", baseTableSchemaName: "eventos", constraintName: "FK6509A50CD32A42A", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "curso", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-27") {
		addForeignKeyConstraint(baseColumnNames: "evento_id", baseTableName: "opcao", baseTableSchemaName: "eventos", constraintName: "FK6509A50B51213AA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "evento", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-28") {
		addForeignKeyConstraint(baseColumnNames: "pergunta_id", baseTableName: "opcao_resposta", baseTableSchemaName: "eventos", constraintName: "FK89CC5830D3A5E5CA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "pergunta", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-29") {
		addForeignKeyConstraint(baseColumnNames: "questionario_id", baseTableName: "pergunta", baseTableSchemaName: "eventos", constraintName: "FK19C3C8B0C089BEAA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "questionario", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-30") {
		addForeignKeyConstraint(baseColumnNames: "comprovante_id", baseTableName: "pessoa", baseTableSchemaName: "eventos", constraintName: "FKC4E40FA7A96E5A74", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "imagem", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-31") {
		addForeignKeyConstraint(baseColumnNames: "evento_id", baseTableName: "questionario", baseTableSchemaName: "eventos", constraintName: "FKF5C3A9FDB51213AA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "evento", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-32") {
		addForeignKeyConstraint(baseColumnNames: "participante_id", baseTableName: "resposta", baseTableSchemaName: "eventos", constraintName: "FKEBB72721AA4E5A8A", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "pessoa", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-33") {
		addForeignKeyConstraint(baseColumnNames: "pergunta_id", baseTableName: "resposta", baseTableSchemaName: "eventos", constraintName: "FKEBB72721D3A5E5CA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "pergunta", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-34") {
		addForeignKeyConstraint(baseColumnNames: "parent_image_id", baseTableName: "thumbnail", baseTableSchemaName: "eventos", constraintName: "FK4F4E50EC13A3E38E", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "thumbnail", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-35") {
		addForeignKeyConstraint(baseColumnNames: "grupo_id", baseTableName: "usuario_grupo", baseTableSchemaName: "eventos", constraintName: "FK4CAEC818D32FF50A", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "grupo", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-36") {
		addForeignKeyConstraint(baseColumnNames: "usuario_id", baseTableName: "usuario_grupo", baseTableSchemaName: "eventos", constraintName: "FK4CAEC81889C586EA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "usuario", referencedTableSchemaName: "eventos", referencesUniqueColumn: "false")
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-37") {
		createIndex(indexName: "authority", tableName: "grupo", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "brunocatao (generated)", id: "1346250881405-38") {
		createIndex(indexName: "username", tableName: "usuario", unique: "true") {
			column(name: "username")
		}
	}

	include file: 'AddTotalDeVagasToMiniCurso'

	include file: 'AddTotalDeVagasToMiniCurso.groovy'
}

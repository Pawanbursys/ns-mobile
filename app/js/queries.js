window.queries = [
	//Drop tables
   "DROP TABLE IF EXISTS Users;",
	//Create tables
	"CREATE TABLE Users (IdUser integer primary key autoincrement, Name text not null);",
	//Insert Users

"DROP TABLE IF EXISTS anl_virtual_pallet;",
    "CREATE TABLE anl_virtual_pallet ( VIRTUAL_PALLET_ID int(11) NOT NULL primary key , ANALYSIS_ID int(11) DEFAULT NULL, DEST_ZIP varchar(20) DEFAULT NULL, DEST_LINE1 varchar(100) DEFAULT NULL, DEST_LINE2 varchar(100) DEFAULT NULL, USER_INFO varchar(500) DEFAULT NULL, PALLET_INFO_ID int(11) DEFAULT NULL, DEST_ZIP_CODES varchar(1500) DEFAULT NULL, MIN_LOAD_CONTAINER int(10)  NOT NULL DEFAULT '0', LINEAR_FEET int(10)  NOT NULL DEFAULT '0', DROPSHIP_ID int(11) DEFAULT NULL );",
	"INSERT INTO 'Users' ('Name') VALUES ('Juan David Nicholls Cardona');",
	"INSERT INTO 'Users' ('Name') VALUES ('Khriztian Moreno Zuluaga');",
	"INSERT INTO 'Users' ('Name') VALUES ('Cristian Rivas Buitrago');",
	"INSERT INTO 'Users' ('Name') VALUES ('Juan David Sánchez');",
	"INSERT INTO 'Users' ('Name') VALUES ('Nicolas Molina');",
	"INSERT INTO 'Users' ('Name') VALUES ('Miyamoto Musashi FIlander');",
	"INSERT INTO 'Users' ('Name') VALUES ('Didier Hernandez');",
	"INSERT INTO 'Users' ('Name') VALUES ('Luis Eduardo Oquendo Pérez');",
	"INSERT INTO 'Users' ('Name') VALUES ('Carlos Rojas');",
	"INSERT INTO 'Users' ('Name') VALUES ('Levano Castilla Carlos Miguel');"
];
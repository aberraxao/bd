-- insert multiple records in a table
INSERT INTO 'pais' ('CodigoPais', 'NomePais') VALUES ('FR', 'França'), ('PT', 'Portugal')

-- update multiple records from a table
UPDATE `utilizador` SET `PaisResidencia`='PT' WHERE`PaisResidencia`='Po'

-- insert a post without the default values
INSERT INTO `post`(`TextoPost`, `PostAutor`) VALUES('O Iscte é a melhor escola do país', 3)

-- i. Quantos posts tem cada utilizador?
SELECT
    PostAutor,
    COUNT(PostID)
FROM
    `post`
GROUP BY
    PostAutor;

-- ii. Quais os nomes e emails dos autores de cada post?
SELECT
    post.*,
    utilizador.NomeUtilizador,
    utilizador.EmailUtilizador
FROM
    post
INNER JOIN utilizador ON post.PostAutor = utilizador.UtilizadorID


-- iii. Qual o(s) utilizador(es) que colocou(aram) mais posts?
SELECT
    PostAutor,
    COUNT(PostID) AS countposts
FROM
    `post`
GROUP BY
    PostAutor
ORDER BY
    countposts
DESC
LIMIT 1


-- iv. Quantos os posts colocados sobre o tema IULCOME?
SELECT
    COUNT(TextoPost)
FROM
    `post`
WHERE
    TextoPost LIKE '%IULCOME%'
	

-- v. Quantos os temas colocados por residentes em Portugal?
SELECT
    COUNT(post.TextoPost)
FROM
    `post`
INNER JOIN utilizador ON post.PostAutor = utilizador.UtilizadorID
WHERE
    utilizador.PaisResidencia = 'PT'
	

-- vi. Qual a distribuição percentual dos posts por países?
SELECT
    utilizador.PaisResidencia,
    COUNT(post.TextoPost) / (SELECT COUNT(post.TextoPost) FROM post)
FROM
    `post`
INNER JOIN utilizador ON post.PostAutor = utilizador.UtilizadorID
GROUP BY
    utilizador.PaisResidencia
	

-- vii. Qual o utilizador que não indicou o país a que pertence?
SELECT
    *
FROM
    utilizador
WHERE
    PaisResidencia IS NULL

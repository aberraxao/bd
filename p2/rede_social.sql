drop table if exists membro ;
drop table if exists likes ;
drop table if exists utilizador ;
drop table if exists post ;
drop table if exists comentario ;
drop table if exists grupo ;
 
create table membro
(
   utilizador_utilizador_ID_   integer   not null,
   grupo_grupo_ID_   integer   not null,
 
   constraint PK_membro primary key (utilizador_utilizador_ID_, grupo_grupo_ID_)
);
 
create table likes
(
   utilizador_utilizador_ID_   integer   not null,
   post_post_ID_   integer   not null,
 
   constraint PK_likes primary key (utilizador_utilizador_ID_, post_post_ID_)
);
 
create table utilizador
(
   utilizador_ID   integer   not null,
   EmailUtilizador   varchar(100)   null,
   NomeUtilizador   varchar(100)   null,
   PaisResidencia   varchar(50)   null,
 
   constraint PK_utilizador primary key (utilizador_ID)
);
 
create table post
(
   utilizador_utilizador_ID   integer   not null,
   post_ID   integer   not null,
   DataHora   datetime   null,
   TextoPost   text   null,
 
   constraint PK_post primary key (post_ID)
);
 
create table comentario
(
   utilizador_utilizador_ID   integer   not null,
   post_post_ID   integer   not null,
   comentario_ID   integer   not null,
   DataHora   datetime   null,
   TextoComentario   text   null,
 
   constraint PK_comentario primary key (comentario_ID)
);
 
create table grupo
(
   utilizador_utilizador_ID   integer   not null,
   grupo_ID   integer   not null,
   Data   date   null,
   DesignacaoGrupo   varchar(100)   null,
   DescricaoGrupo   text   null,
 
   constraint PK_grupo primary key (grupo_ID)
);
 
alter table membro
   add constraint FK_utilizador_membro_grupo_ foreign key (utilizador_utilizador_ID_)
   references utilizador(utilizador_ID)
   on delete cascade
   on update cascade
; 
alter table membro
   add constraint FK_grupo_membro_utilizador_ foreign key (grupo_grupo_ID_)
   references grupo(grupo_ID)
   on delete cascade
   on update cascade
;
 
alter table likes
   add constraint FK_utilizador_likes_post_ foreign key (utilizador_utilizador_ID_)
   references utilizador(utilizador_ID)
   on delete cascade
   on update cascade
; 
alter table likes
   add constraint FK_post_likes_utilizador_ foreign key (post_post_ID_)
   references post(post_ID)
   on delete cascade
   on update cascade
;
 
 
alter table post
   add constraint FK_post_publica_utilizador foreign key (utilizador_utilizador_ID)
   references utilizador(utilizador_ID)
   on delete restrict
   on update cascade
;
 
alter table comentario
   add constraint FK_comentario_inseridopor_utilizador foreign key (utilizador_utilizador_ID)
   references utilizador(utilizador_ID)
   on delete restrict
   on update cascade
; 
alter table comentario
   add constraint FK_comentario_incidesobre_post foreign key (post_post_ID)
   references post(post_ID)
   on delete restrict
   on update cascade
;
 
alter table grupo
   add constraint FK_grupo_dono_utilizador foreign key (utilizador_utilizador_ID)
   references utilizador(utilizador_ID)
   on delete restrict
   on update cascade
;
 

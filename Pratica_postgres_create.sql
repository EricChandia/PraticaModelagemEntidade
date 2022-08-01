CREATE TABLE "public.usuarios" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"preco" double NOT NULL,
	"fotoId" integer NOT NULL,
	"tipoId" TEXT NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtosFotos" (
	"id" serial NOT NULL,
	"url" serial NOT NULL,
	"tipo" serial NOT NULL,
	CONSTRAINT "produtosFotos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categorias" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categorias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.roupas" (
	"id" bigint NOT NULL,
	"tamanho" char NOT NULL,
	"categoriaId" char NOT NULL,
	"tipoId" char NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.compras" (
	"id" serial NOT NULL,
	"estado" TEXT NOT NULL,
	"dataCompra" DATE NOT NULL,
	"dataEntrega" DATE NOT NULL,
	"idEndereco" integer NOT NULL,
	"compraProdutoId" integer NOT NULL,
	"pagamentoId" integer NOT NULL,
	CONSTRAINT "compras_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.comprasProdutos" (
	"id" serial NOT NULL,
	"produtoId" integer NOT NULL,
	"quantidade" integer NOT NULL,
	CONSTRAINT "comprasProdutos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.enderecos" (
	"id" serial NOT NULL,
	"rua" TEXT NOT NULL,
	"numero" TEXT NOT NULL,
	"complemento" TEXT NOT NULL,
	"cidade" TEXT NOT NULL,
	"estado" TEXT NOT NULL,
	"cep" TEXT NOT NULL,
	"idUsuario" TEXT NOT NULL,
	CONSTRAINT "enderecos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtosTipos" (
	"id" serial NOT NULL,
	"tipo" serial NOT NULL,
	CONSTRAINT "produtosTipos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pagamento" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	CONSTRAINT "pagamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pagamentoTIpo" (
	"id" serial NOT NULL,
	"nome" serial NOT NULL,
	"pagamentoId" TEXT NOT NULL,
	CONSTRAINT "pagamentoTIpo_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cartaoDeCredito" (
	"id" serial NOT NULL,
	"idTipo" bigint NOT NULL,
	CONSTRAINT "cartaoDeCredito_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Boleto" (
	"id" serial NOT NULL,
	"idTipo" integer NOT NULL,
	CONSTRAINT "Boleto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Pix" (
	"id" serial NOT NULL,
	"idTipo" integer NOT NULL,
	CONSTRAINT "Pix_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("fotoId") REFERENCES "produtosFotos"("id");
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk1" FOREIGN KEY ("tipoId") REFERENCES "produtosTipos"("id");



ALTER TABLE "roupas" ADD CONSTRAINT "roupas_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id");
ALTER TABLE "roupas" ADD CONSTRAINT "roupas_fk1" FOREIGN KEY ("tipoId") REFERENCES "produtosTipos"("id");

ALTER TABLE "compras" ADD CONSTRAINT "compras_fk0" FOREIGN KEY ("idEndereco") REFERENCES "enderecos"("id");
ALTER TABLE "compras" ADD CONSTRAINT "compras_fk1" FOREIGN KEY ("compraProdutoId") REFERENCES "comprasProdutos"("id");
ALTER TABLE "compras" ADD CONSTRAINT "compras_fk2" FOREIGN KEY ("pagamentoId") REFERENCES "pagamento"("id");

ALTER TABLE "comprasProdutos" ADD CONSTRAINT "comprasProdutos_fk0" FOREIGN KEY ("produtoId") REFERENCES "produtos"("id");

ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_fk0" FOREIGN KEY ("idUsuario") REFERENCES "usuarios"("id");



ALTER TABLE "pagamentoTIpo" ADD CONSTRAINT "pagamentoTIpo_fk0" FOREIGN KEY ("pagamentoId") REFERENCES "pagamento"("id");

ALTER TABLE "cartaoDeCredito" ADD CONSTRAINT "cartaoDeCredito_fk0" FOREIGN KEY ("idTipo") REFERENCES "pagamentoTIpo"("id");

ALTER TABLE "Boleto" ADD CONSTRAINT "Boleto_fk0" FOREIGN KEY ("idTipo") REFERENCES "pagamentoTIpo"("id");

ALTER TABLE "Pix" ADD CONSTRAINT "Pix_fk0" FOREIGN KEY ("idTipo") REFERENCES "pagamentoTIpo"("id");
















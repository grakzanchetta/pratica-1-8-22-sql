CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"customerName" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"productName" TEXT NOT NULL UNIQUE,
	"price" money NOT NULL,
	"mainPhoto" TEXT NOT NULL,
	"size" varchar(1) NOT NULL,
	"category" varchar(10) NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productAlbum" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"mainPhoto" TEXT NOT NULL,
	"photos" TEXT NOT NULL,
	CONSTRAINT "productAlbum_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerAddresses" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"compliment" TEXT,
	"postalCode" TEXT NOT NULL,
	"cityId" serial NOT NULL,
	"stateId" serial NOT NULL,
	CONSTRAINT "customerAddresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"stateId" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productsPurchased" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"customerId" serial NOT NULL,
	"amount" int NOT NULL,
	CONSTRAINT "productsPurchased_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"size" varchar(1) NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"category" varchar(10) NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"purchaseId" serial NOT NULL,
	"purchaseState" serial NOT NULL,
	"purchaseDate" DATE NOT NULL,
	"purchaseAddress" serial NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseState" (
	"id" serial NOT NULL,
	"purchaseState" TEXT NOT NULL,
	CONSTRAINT "purchaseState_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("size") REFERENCES "sizes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("category") REFERENCES "categories"("id");

ALTER TABLE "productAlbum" ADD CONSTRAINT "productAlbum_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "productAlbum" ADD CONSTRAINT "productAlbum_fk1" FOREIGN KEY ("mainPhoto") REFERENCES "products"("mainPhoto");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk2" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");


ALTER TABLE "productsPurchased" ADD CONSTRAINT "productsPurchased_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "productsPurchased" ADD CONSTRAINT "productsPurchased_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");



ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("purchaseId") REFERENCES "productsPurchased"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("purchaseState") REFERENCES "purchaseState"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("purchaseAddress") REFERENCES "customerAddresses"("id");














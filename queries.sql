CREATE TABLE "Employees" (
  "FullName"        TEXT NOT NULL,
  "Salary"          INT NOT NULL,
  "JobPosition"     TEXT NOT NULL,
  "PhoneExtension"  INT,
  "IsPartTime"      BOOLEAN,
  "Id"              SERIAL PRIMARY KEY
);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Nam Pham', '1000', 'software developer', '727', 'false');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Kate Howard', '500', 'junior developer', '813', 'true');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Gordon Ramsay', '2000', 'cook', '900', 'false');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', '100', 'customer service', '100', 'true');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Guy Fieri', '1500', 'cook', '727', 'false');

SELECT * FROM "Employees";

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = false;

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jake Baker', '450', 'software developer', '727', 'true');

UPDATE "Employees"
SET "Salary" = 500
WHERE "JobPosition" = 'cook';

DELETE FROM "Employees"
WHERE "FullName" = 'Lazy Larry';

ALTER TABLE "Employees"
ADD COLUMN "ParkingSpot" VARCHAR(10);
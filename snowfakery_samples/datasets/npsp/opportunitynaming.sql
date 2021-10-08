BEGIN TRANSACTION;
CREATE TABLE "npsp__Opportunity_Naming_Settings__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"npsp__Attribution__c" VARCHAR(255), 
	"npsp__Date_Format__c" VARCHAR(255), 
	"npsp__Opportunity_Name_Format__c" VARCHAR(255), 
	"npsp__Opportunity_Record_Types__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "npsp__Opportunity_Naming_Settings__c" VALUES(1,'10/8/2021, 4:36 PM','Both','yyyy-MM-dd','{!Account.Name} {!Amount} {!RecordType.Name} {!CloseDate}','');
COMMIT;

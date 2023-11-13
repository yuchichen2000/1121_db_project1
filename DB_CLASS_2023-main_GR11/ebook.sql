--------------------------------------------------------
--  �w�إ��ɮ� - �P���G-�T��-21-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CART_TNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "GROUP11"."CART_TNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MEMBER_MID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "GROUP11"."MEMBER_MID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ORDER_OID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "GROUP11"."ORDER_OID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "GROUP11"."CART" 
   (	"MID" VARCHAR2(26 BYTE), 
	"CARTTIME" VARCHAR2(26 BYTE), 
	"TNO" VARCHAR2(26 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "GROUP11"."MEMBER" 
   (	"MID" VARCHAR2(38 BYTE), 
	"NAME" VARCHAR2(128 BYTE), 
	"ACCOUNT" VARCHAR2(128 BYTE), 
	"PASSWORD" VARCHAR2(128 BYTE), 
	"IDENTITY" VARCHAR2(128 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDER_LIST
--------------------------------------------------------

  CREATE TABLE "GROUP11"."ORDER_LIST" 
   (	"OID" NUMBER(38,0), 
	"MID" NUMBER(38,0), 
	"ORDERTIME" DATE, 
	"PRICE" NUMBER(38,0), 
	"TNO" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "GROUP11"."PRODUCT" 
   (	"PID" VARCHAR2(26 BYTE), 
	"PNAME" VARCHAR2(128 BYTE), 
	"PRICE" NUMBER(38,0), 
	"CATEGORY" VARCHAR2(128 BYTE), 
	"PDESC" NVARCHAR2(1024)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECORD
--------------------------------------------------------

  CREATE TABLE "GROUP11"."RECORD" 
   (	"TNO" NUMBER(38,0), 
	"PID" VARCHAR2(26 BYTE), 
	"AMOUNT" NUMBER(38,0), 
	"SALEPRICE" NUMBER(38,0), 
	"TOTAL" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into GROUP11.CART
SET DEFINE OFF;
REM INSERTING into GROUP11.MEMBER
SET DEFINE OFF;
Insert into GROUP11.MEMBER (MID,NAME,ACCOUNT,PASSWORD,IDENTITY) values ('1','���j��','mingwang','test','user');
Insert into GROUP11.MEMBER (MID,NAME,ACCOUNT,PASSWORD,IDENTITY) values ('2','�]�p��','may','test','user');
Insert into GROUP11.MEMBER (MID,NAME,ACCOUNT,PASSWORD,IDENTITY) values ('3','�L�j��','weiLin','test','user');
Insert into GROUP11.MEMBER (MID,NAME,ACCOUNT,PASSWORD,IDENTITY) values ('4','������','maychang','test','user');
REM INSERTING into GROUP11.ORDER_LIST
SET DEFINE OFF;
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (1,4,to_date('04-7�� -21','DD-MON-RR'),4350,1);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (2,1,to_date('26-4�� -21','DD-MON-RR'),1500,2);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (3,2,to_date('18-8�� -21','DD-MON-RR'),1300,3);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (4,3,to_date('31-5�� -21','DD-MON-RR'),800,4);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (5,2,to_date('09-12��-21','DD-MON-RR'),700,5);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (6,2,to_date('05-9�� -21','DD-MON-RR'),1100,6);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (7,2,to_date('16-7�� -21','DD-MON-RR'),1200,7);
Insert into GROUP11.ORDER_LIST (OID,MID,ORDERTIME,PRICE,TNO) values (8,4,to_date('27-2�� -21','DD-MON-RR'),100,8);
REM INSERTING into GROUP11.PRODUCT
SET DEFINE OFF;
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('u58046','�ӫ~1234',888,'BOOK','�J�A�ܴ����L�A��~�}�񪺰굦�����ܡC������H�]�n�קK�b���Ӫ�����g�٤������]�s�M���C�n����o�@�I�A�N�ݭn��H������g���~�A�����ۥD�o�i��O�C����H�����o�y�ܫܦn���A�o�غ믫�ȱo����H�ǲߡC�o�q�����کҦ����ôb�y���ŵM�}�ԡC�C�ӤH���@�ͤ��A�X�G�i���I��ӫ~123�o��ơA�O���M�|�o�ͪ��C�p�G���ɧڭ̿�ܩ����ӫ~123�A����G�i�Q�Ӫ��C\n �ڷQ�A��ӫ~123���N�q�Q�M���A��U��ӻ��ä��O�@���a�ơC�B�������L�A��Ǫ��i�i�O�Q���w�C���A�ݭn����~��q�@�I��F�t�@�I�C�o�q�ܫD�`���N��C�ӫ~123�]��ӵo�͡H�@�ɻݭn�ﭲ�A�ݭn��ӫ~123���s���{���C�ڭ̳����Ӧ@�ѡA�Y���D�ܧx���A���N�ե����n�ѨM�C�ӫ~123�ե�������k���ӡC���״����L�A�Ѥ~���O�O���A�ӬO���ҩM�ԾġC�o�q�����کҦ����ôb�y���ŵM�}�ԡC�C�ӤH�����o������o�ǰ��D�C�b����o�ذ��D�ɡA�ȥ��ԲӦҼ{�ӫ~123���U�إi��C����ӫ~123�A�A�|�Q�줰��O�H');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('v00111','�^��',400,'DVD','�� �m���ܡn�M�m�^���n�O�^��߼@�j�v�B���n�ѻ�쪺�j�v�H�����o������������P���ܬ����H���s���z����þ���ܡC�b�o�M�Ѥ��A������P���ܥH�@���t���M�@�a�����������A���s�޲z�F��þ���ܪ��ߵ��A�å����@�u���N���̦��p�_�ӡA���������F��þ���ܪ��͵w�P�M�ǳN�P�A����þ���ܽᤩ�F��[�״I�����`�B��[�A�����өʩM�㦳�l�ޤO���q�v��P�C\n �� �p�G���m���ܡn�O�ѧ�þ�����զ����@�ӡ��_�����p�����A���m�^���n�N�O����þ���ܤ����^����W���᪺�W�߭^���q�v�C�b���Ѥ��A�ڭ̥i�H���H���ܪ����z�ݨ�G\n ��yi�o��F���ת��^���ĺ��״���˱�������諸�Y�`�F\n �@�߷��г������ԧJ�Ǵ��p��b���Ԫ��A�G�U���W�^�������F\n �����}�����o���Ϥ򪺥�����A���]�k�H�A�Ѥ]�k�H�F\n ���������Q�P�����f�ȡA�˦۱����ۤv���Ĥl�M��������s�w�F\n �o�����@�ʪ��B���쪺�B�d�@�ʪ��M�ë��G�Ƴ��i�H�b���Ѥ��ݨ�C�i�H���A��þ���ܬO�@�ӥ��j���_�w�A�Ӵ�����P���ܴN�O�@����q���_�w�޸��H�A�a��ڭ̥h�ݥ��s�����h�g�H�B�h����C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('d11222','������M��T',300,'CD','1990�~�ѷs��ۤ��X�����u�A�ݤ@���v�A�O������q�ۥͲP�����i�ӤH�M��A���M�����ߡA�o�O�C�K�ɴ��ڷQ���|���_�I�C�ѩ������j�@�N�}�l��Band�A20���ɧ�i�}�ն�DJ���ͲP�A�s�@�H�]���w��L�������G�B�����H�M�ӤS���R���֪��S��A�D��F���ֻ��֬ƦܴI���`���P���q���A���O�q�N���@���ۥѡr�B�q�b�V�ȫ�r�B�q�~�����ߡr�H�έ��n�u�������q�ڷQ�w���Ҧ����R�r���ݳo�������q���C�C�ߪ��ն鷳��A���F�s´���ڷQ�P�S�̪����˥~�A�R����b�~���ͩR���e�����n���@�u���a�A�D���q�q�A�ݤ@���r�H�Ρq�O�A�^�Y�r�B�q���@�q�Q�p�����r�M�q�p���ߧڪ��D�r�A�b�b���i�{�F�p�����ɳ�¦ӤS��ı���R���[�P�����C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b20666','OLAP�i��',500,'BOOK','�a�۳o�ǰ��D�A�ڭ̤@�_�Ӽf��OLAP�i���C�ԧB�p�۫H�A�b�f�H�Y�N��¡�ɡA�ШӪ���ͬO���B���C�o�ҵo�F�ڡC�R�]���Z���g����L�A��Ǭ�s���P�@�k�h�A�Y�@���ƪ������ͨ��M��۵M�W�ߡA�o�]�A�Ω�H�̪���ʡC�o�y�ܥO�ڤ��T�P�n���D�������ʡC�z�L�f�V�k�ǡA�o�H�γ̨Ϊ������h���ROLAP�i���C�{�b�A����OLAP�i�������D�A�O�D�`�D�`���n���C�]���A���w�۬۫H�A���ȯB���B�沴�A�u�t���b�̰��h�C�o�q�����ڪ��߹Ҵ����F�@�Ӽh���C�`�Ө����A�ӳo�Ǩä��O�������n�A��[���n�����D�O�A�{�F�һ��L�A�H�����ҥH��i�B�A��a���ҥH��I�j�A���|���ҥH��w�w�A�ڥ��N���b��F�v�C�o�y�����ڭ̱o��F�@�ӥ��s���[�I�h��ҳo�Ӱ��D�C�@������A�ڭ̳������ȥ��V�����Ҽ{�Ҽ{�C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b10234','�޲z��T�t�η���',600,'BOOK','�H�u���z�B���p���B�j�ƾڡB���Ĭ�ޡB�϶��쵥��IT���s��ަb2017�~�H��v���ѹ���Ǩ��X�A�i�J�F�ӷ~��������Զ��q�CAI���۾r���B���z�U�z�B��Ѿ����H�B�u�~�����H�BAI�����BAI���ġBAI�w���BAI�k�߾Q�ѻ\�a�a�����F�ǲβ��~�A�\�h�M�a�w��10�~�����i��H����50%���u�@�N�QAI�Ҩ��N�C��MAI�p�G�A�f�t���p���B�j�ƾڡB���ݤ�5G�H���O�p��K�l�B½���Цa�B�U���i�סCMIS�H���p��Φ��a�w���B�ǳơA�άO�p�󵽥[�Q�γo�ǪZ����M�O�@�ӫD�`���n��ĳ�D�C\n �Ӧb���~�g����t�譱�A2018�~���y���ȳ̰����e�C�j���q�]�Aī�G�B���q�B�L�n�B�Ȱ����B�y�ѡB�˰T�P�����ڤڡA�@�߳��O���x�����g��Ҧ��A�����S���D�ɲ��~���s�y�P�c��A�u�O���Ѥ@�Ӥj�a�@�s�@�a�����x�C�o�غ����g����t�U�A�S�����B�D�`���\���g��Ҧ��A���ӱN�|�O���~�D�y���g��Ҧ��C���x�g����t�U���C���W�h�B�v�������B��´���c�B�귽�t�ΡB���q�Ҧ��A���P�ǲΪ����~���D�`�j�����P�A���o�إ��ӥD�y���g��Ҧ��AMIS�H����M���Ӳ`�J���h�A�ѡC�]���������睊���I�]�A�G���s���g�T�ӳ��`�A(1)�H�u���z���޳N�B���λP�����A(2)���x�g����t�A(3)���x�g��Ҧ��P�v�������C���~�]�[�g�F���p���B���Ĭ�ޡB�϶���B5G�B���z��P�B�s�s��κ����g�ٵ��̷s�����e�A�Ʊ��b�̪񷥬��ֳt�ܰʪ�������ҤU�A����MIS�P�n�@���i�H��W�ɥN���Ь�ѡC');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b40555','�t�Τ��R�z�׻P���',550,'BOOK','���ѩ��մ��ܵ��XMDA�PUML������ɦV���R�P�]�p�A�X�R�t�Τ��ʺA�欰�P�R�A���c��Ҥ�k�סA�H�j�ƪ���ɦV�t�Τ��R�P�]�p����ΩʻP���ΩʡC���~�A�X�RMDA���ഫ��k�פΨ�PCASE�u�㤧��X�A�H�j�ƨt�ζ}�o���۰ʤơC���e�s�Ʀ@���|�ӳ����G\n �������Шt�ζ}�o�Ҧ��]�Ҧp�r���B�����BRUP�B�ʺA�t�ζ}�o�BScrum�PMDA���Ҧ��^�A�H�μҲդƨt�βz�סB����ɦV�޳N�B����ɦV�t�λP��@�A�]�A����ɦV���򥻷����]�Ҧp����B���O�B��H�ơB�ʸˡB�~�ӻP�P�W�������^�B�t�Τ��R�P�]�p��Ҥu��]�pUML�^�P�[�I�C\n ���۶}�l���Шt�ζ}�o���ݨD���R�P��ҨB�J�A�]�A���лݨD�^���覡�B��Ҥu��P��k�סB�j�����R�A�Ψ䲣�X���]�Ҧ��^���C\n �A���Ъ���ɦV�t�Τ��R�P�]�p�B�J�A�]�A���󤬰ʦ欰��ҡB���c��ҡB���O���W�Ƶ����ʡB��Ҥu��P��k�סA�Ψ䲣�X�Ҧ����C\n �̫ᤶ�е��XMDA�PUML�A�q�t�Τ��R�B�t�γ]�p�ܵ{���Ҧ����ഫ�B�J�P��k�סB�t�Τ���P���c��Ҥu��P��k�סA�Ψ䲣�X�Ҧ����C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('N41023','test',400,'DVD','�o�ˬݨӡA�����ǧi�D�ڭ̡A�n�����ǡA�����L�������A�}�L���D�a�C�o���G�ѵ��F�ڪ��ôb�C�Y�줵�ѵ����ɧڭ̳��ٵL�k��M���ժ��N�q�A���Q���ڭ̬Q�Ѥ]�L�k��M�C�J�Ԩv�����L�@�y�N�q�`�����ܡA�p�^�O�W�Ҫ��j���C�o���G�ѵ��F�ڪ��ôb�C���D���֤ߨs���O����H�q�o�Ө��רӬݡA���@��H�ӻ��A���ըs���H�x�ۤ���O�H�N�ڭӤH�ӻ��A���չ�ڪ��N�q�A���ण���D�`���j�C���A�Y������M���A������դ]�N����������F�C���Ǵ����L�A�N���ѤH�C�o�y�ܬݦ�²��A���䤤�����{���T���H�`��C���ԧB���g���L�A���|�˪F��@�h���_��G�X�f�����A�g�X���b�A�L�h���ɶ��A���L�����|�C�o�q�ܪ��l�����_�b�ڸ������j���ۡC���ڴ��g�{���A�b�@���j�Ʒ~�W�A�H�b�}�l���ƫe�n���d�������˹�ݮɾ��A�Ӧb�i��ɭn���d�⯫���˧��ɾ��C�o�O�ٰʤH�ߪ��C���޴��լݦ����㲴�A�o���ڤF�ڪ������C�b�o�ؤ��i�קK���Ĭ�U�A�ڭ̥����ѨM�o�Ӱ��D�C�ڭ̻ݭn�^�O�¦����[���A��ڭӤH�Ө��A���դ��ȶȬO�@�ӭ��j���ƥ�A�٥i��|���ܧڪ��H�͡C�@������A�ڭ̳������ȥ��V�����Ҽ{�Ҽ{�C�Y�L�k�����z�Ѵ��աA���ȷ|�O�H�����@�j��ѡC�o���w�O�ӫe�äj�x���Q�k�C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('n02345','������T�޲z',600,'BOOK','���ѲĤT���b�q�l�������зs�B�j�ƾڻP���z�����B�q�l��������P��줣�����зs�����ѡA�󦳥��~���g��Ӯ׹��ҡA���Ѳz�׻P��ȵ��X�A��Ū�̥i�H��`�J�A�ѥ��ѽ׭z���зs�[���ήɥN�ͶաC���e�s�Ʊq��T��ަp��P�i���~�зs�P���ȳгy���[�I�X�o�A�@���|�ӳ����G �����аӷ~�Ҧ��P�зs���A�B���~���ȲպA�]�]�A������B���Ȱө��B���Ⱥ����P���Ȧ@�ХͺA�t�^�B�֤߬y�{�P�һݤ���T��ޡB�q�l���������t�i�A�öi�@�B���Цp��N��T��޻P�ӷ~�Ҧ����X�A�H�P���q�l�������зs�A�i�ӳгy���ȡC ���ۤ��йq�l�������һݤ���T��ް�¦�]�I�P���ΡA�]�A�u���p���ϡv���[�c�P�����A�������w��B�����P�q�T�޳N�B�˸m�B�n��P��T�w���B��T�۲z�P���p�B�q�l�f�����C �A���йq�l���������@���y�{�P�֤߬�ޡA�]�A�������x�P���s�B�����@�~�P��T�t�ΡB�j�ƾڻP���z�����C �̫ᤶ���������c�g��޲z�P�[�Ȩt�ΡA�]�A��T��ަp�󴣤���|�귽�W���B�q�l�Ʀ�P�P�Ȥ����Y�޲z���C �夤�S�O�w��W�zĳ�D�s�@�Q�h�����������ӮסA�H�L�㪺�覡�ĩ��䤺�[�P�[���A�Ʊ�ϨS���`�p�޳N�I����Ū�̥���A�Ѳ{�N�����޲z������ƪ���T��޻P�޲z���ѡA�H�θ�T��ަp��P�i�����зs�P���ȳгy�C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('A12333','��T�w������',500,'BOOK','���ѥD�n���Q��¦�q���@�~�t�ΡB�����ǿ�覡�B�����۲z�θ�T�w�������~�����n�ʤ�����覡�A�ñq�q���޳N���L�h�B�{�b�P���ӭ��V�A�`�J�F�Ѻ������o�i���v�B�ǿ�޳N�B�����Ƨ޳N���h�����e�C ���ѯS�� �@�B����T�w�������Ф��ȥ]�t�޳N�h���A��ǤJ�D�޳N�h�����¯١]�p����u�{���^���e�A��Ū�̲`����|��T�w�������n�ʡC �G�B�Ҷq���~�����y�{�A�N��T�w�����޳N���X�ܥ��~��ȡA�äj�q���γ̷s����T�ӮסA��Ū�̤F�Ѹ�w�޲z�b���y�U�����~��������ΡC �T�B���Ѧۧ��˴�����k�A��Ū�̦ۦ��˴��P�D�]�ƪ���T�w���C �|�B�ޥθ�T�w����쪾�W���~�����ƾڡA���UŪ�̤F�Ѹ�w�������ͶդΫ¯٪����d���I�C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('A12344','�ϸѸ�T�t�Φw��',400,'BOOK','? �ꤺ�~���W�����D���b�ȤJ�I�������ɦ��һD�A�b�Ȧp��i�����?�t�ΤS�Ӧp��P�b�ȹ��? �o�ǳ��ݭn���򥻪��{�ѡA�~��O�@��T�t�Φw���ʡC ? ���Ѥ��e�N��T�t�α`�����z�I�i�椶�СA�z�L��߳]�p���ϸѡA�f�t�`�J�L�X�������覡�A���ȥi�F���b�ȧ�����k�A�]��q���ǲߥ��T�����m��k�A�קK�}�o��@�W�`�Ǫ������C ? ��T�t�Φw�������n�ʤ����ӳ�A�ä��O�t�ζ}�o�H���~�ݭn�ǲߪ����ѡA�u�n�O��T�t�ΨϥΪ̡A���ݨ�Ƥ@�w����T�w���`�ѡA�~���קK���ͤ��}���ާ@�欰�C���ѧ@�̱N���~����ȸg��i����ɡA�ت��O��Ū�̹��T�t�Ϊ��w������I���һ{�ѡA�F�Ѩ�I���z�ι�@�A��ָ�w�ƥ�o�ͪ����|�C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('V10889','���Q�i�S�G�������K��',400,'BOOK','�o�ӮL�ѵ����e�A���Q�������ӯ�����Q�����N��د��C���H�⤣�p�Ѻ�A�a�x�p���F�h���M�y�X�Aĵ�i�L�Y�O�^��ǮաA�N���{�ͩR�M�I�I���F�����Q�����u�_���v�A�h�񤣦��d�I�F�Ҧ��B�̱ͭH�Ӫ��H�A�٥��]�k���`�L�A�`�L�G�D�T���C �����Q�l�׫ܲM���A�ۤv����^���N��د��C�L�Q�����y�õۯ��K�q�D�M���F�������A�Q���L���]�k�ҵ{�B�ѿ��Y�N�e�F���l��A�H�ι����ѻڪ���a�_�C�ϩ�ť��F�L���ߪ��I��A�n�ͺa���r�ۭ��Ѩ��A�w�O��L�q���V�a���ϤF�X�ӡC �ɤW�G�~�Ū����Q�A�]�����h��a�]���^�i���ݡA�������ժ������H���A�Q���w�[���ն�ͬ��A���G���F���Ϊ��}�ݡC���M���o�]�b���ɮ��M�ӦܡA���O�L�H�����Y�X�{�F�޲����ջy�n�A���۳��o�ͤ@�s��ŧ���ƥ�C �޲z�����C���ߡB�R�����Q���@�~�žǧ̡K�K�D��u�ۤơv���Q�`�̳���W�[�C���D�A�h��ĵ�i���u�F�ܡH�Ǹo�{���d�U�������T���u�K�ǡv�S�N��ۤ���N�q�H�@�ӮI�äF���Q�~���i�ȯ��K�A���@�B�B�޻⫢�Q���V�I�ҡK�K');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('V10890','���Q�i�S�G������§��',650,'BOOK','�C�@���^��������A���Q�i�S�������ΫݷQ���I���}�A�����~���L�ä��t��A�P�L�@�P�M�������u�w��§���a�A�٦���L�u���ӫ��Q�v�C���F���d��a�]ŧ���A��ķ|���Ův�̥��ܨ������˦����Q�A�L���C�����@�L�k���ô��z�a���}�ޫΡC ���M�������h�F�H���Q�h�A�����Q�ëD�@�L�����·t�դO�����|�A�q�H���Q�h�d�U���򪫤��A���Q�P�٦�̱��V�X�u�����t���v���u���C�o�O�T�󷥬��j�j���]�k�D��A�۶ǥu�n�����t���N����D�_���`�A�ӳo�]�N�O���Ѧ�a�]�����n����C ���Q�����|�����A���]�������߫o������A�p������a�]���ȥD�_�F����]�k���A�N��د���w�M�b���i�C���F�u�@�ۤv�`�R���@���A���Q�����j�_�M�Ԫ������A������Ԧ�a�]�C���ޥ��ˬI�[���O�@�G�w�M���ġA���ޫH�������̱ͭ��s�I�q�A���޳o�N�N���ۡA�L�i�ॲ���묹�ۤv���ͩR�K�K');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('V10891','���Q�i�S�G�����d�Z���k��',400,'BOOK','���V�h�h�S�n�ӤF�I�o�ӦW�r�@�X�{�b�w��§�a�A�N�N��۫��Q�����@�g���c�ڡC�p�ɭԪ��j���j�A�o�|�Τ���r�V���Q���}�A�K�o�LĹ�L�F�O�A���@�~�L���p�߽��F���V�i�����Y���A�u��b��W����T��b�]�C���V�h�h��w��§�a�Ҧ��H�@�ˡA���H�S�C�L���֡A����o�V�d�F���Q�������A�Q�L���]�k�ܦ��j��y�K�K �b�¥ʪ��@�ɸ̾զۨϥ��]�k�O���o�A���Q��ߦۤv�@�ɪ��İʡA�|�`�L�û��^���F�N��د��A�������]�k�@�ɨӻ��A�����񺿮V�h�h���Y�����ơC�ѯT�P�D���ܧJ�k���F�����d�Z�ʺ��I�Q�T�~�e�A�L�u�U�F�@�ӶA�G�A�N�����F�Q�T�ӤH�A�p���o�Ӧ�a�]�l�H�̪��Y���ؼСA���O�X�X���Q�i�S�I �n���e���^���N��د��A�ɤW�T�~�Ū����Q�o�o�{�A���ƪ��u�ʨg�]�v�w�g�����i�n�ն�C�o�O�]�k�����F�l���ѯT�P�ҩ�X�����c�ͪ��A�e�̳߷R�G�ѩM����A�|�N�H�̤ߤ����@�������n�����l���p�ɡC�e�̪���ӡA���쥻�N�w�M���|�񪺮ն�ͬ��A�ܱo��[�O�H�򰩮��M�C�ӴN�b���ɡA�e�R�Ǫ��Z�ѩg�б¡A���b���Q�����M���ݨ�F�u���`�v���w���K�K');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b30771','����ѱM��G�ĤG�H��',400,'CD','�u�Ȭw�ѹΡv��������H�T�~�A�Y�N��12/16�����o��u�@�~�K���v�A���M�q�g���V���ߵJ�����ݡA����Ѥ��M�����s�M��W�٫O�K��a�A�����|����Ȭw�o���O�̷|�A�b�O�̷|�W�A����Ѳש󤽧G�s�M��u�@�~�K���v�������W��-�m�ĤG�H�͡n�C�D�۪��H����: �u���M��i�M�誺�I���O�@�ɥ���A���֤߶ǹF���O�A�p�G�̫᥽��S����ӡA�A�N�����|��ܧA���m�ĤG�H�͡n!�v��_�@���¥H���樤�׸����@�ɥ��骺�@�~�A����ѦA�׮i�{����Ѧ������P�@���[�C2012�~�A�s�M��m�ĤG�H�͡n��ܱNĲ����e�B�V�~�b�@�ɥX�o�A�q���騫�V�s��A��Ұ_��짻���Ѫ����j�R�D�A�ѥ~�ܤ��a��Ҧ�ť���ߥX�F�j�v�ݡC�u�W�@�i�@�~�C���m��C�K�����֡n�N�ڭ̤H�Ͳ{���q�Q�n�ͭz���D�D�������F�A����ѵ��ݤT�~���C�U�ӭn�ǹF���T���C�v���H���D�C�u�p�G2012�~�������@�w���v�����u�A�b�o�ݦ��̫�˼ƪ��ͩR���Y�A�ڭ̸ӭn�p�󭱹�ڭ̦U�۪��H�͡H�o�I�v��ĭ�C���s�M�誺��Ү֤ߡC�v����ѻ{�u����ܡA�u����ѥ��ӬO���۫H���@�סA���q�Z�t�j�a�_�}�l�A�o�X�~�ӦU���Ѩa�H�ױ��s���_�o�͡C�@����311�饻�F�_�j�a�_�ɡA�˲��b�q���W�ݨ����S½���A�Ʀܤ޵o�ֹq�t�z���A��g�~���A�o�~��ı�A�y����z���P�ڭ̥ͬ����y����z�u���@�u���j�A�ש�T�w�n�ĥΥ���@���s�M�誺�D�D�C�v�ӳo�i�M��󤵦~�|��饻���S��@�Ӥ�̹w�w�����O�Φ����g�¯٤U���F�ʶ}���A�b���q�B�ʤ��B�a�H�Ϲﵥ�h�����O�U�A�m�ĤG�H�͡n���G�R���`�w�n�G�ۤ���Ѭ�}�L���ݥ@�ɬݤH���[�I!�N�L����Y��ܡA���M�a�H�B���q�P�Ʒ|��ߡA���O�L�̤���Ʃw���u�@�q�L���U�A�u�ɤO���n�ڭ̥��ӴN���Ӱ��n���Ʊ��A�N���p�G���ѯu���O�@�ɥ���A���ѸӤW���q�i�ڭ��٬O�|�{�u�W�C�v���M�M��D�b�����ݦ��Y���e�j�A����Ѥ]���ѷd���G�u�Ʊ椣�|���q�g�]���M��W�٤��O�m�ըȤK�_���n�ӧ�w�ʪ��M��h�f�C�v');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b30772','����ѱM��G����',450,'CD','�����6���s�q�[6�~��سǧ@�Y�N�j��ŧ�x ���i�D���i�ʷRing�jMV�m����B���o���� �M�w�ӬO�ɭ����j�a�R�U�ӡA�n�n�ˬd�ۤv�@�w�������~�P�_�X��@�L�ݮ��Ŷ�����~�A�n���ۤv�P�q�g�@�@���`��z�A��줭�ӤH�U�@�Ӥ��~�s���X�o�I�C���@���k�s�A���s��^�P�����ʷR���߱��A�n�^�k�Ĥ@�i�M��o�檺�L�ѵo���C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('d03333','5566�M��',450,'CD','�g�P�I�o������Y�n�U�j�Ʀ�]�a�x�I�Ȭw�ѹ�5566���i���@�~�A�a�x��աA�ҦV�����I\n �y�\���������q�o��A�W�ȥ[�ءG\n ��2���s�q�]C��est si bon+It��s Our Party Time)��12����粒��MV\n ��5566���~�a�x�M��ʭ���Ų�����]�ث~�����bCD�]�ˤ��^\n �����B�\���B��O�B�@�O�A���N�E�ʤK�Q�G�Ѫ����׫a�x�����C�Ȭw�ѹ�5566 ���i�W�Ⱥ��g��@�~�A3���s�q+12�����C�O�P���B�籡�P�ʷP�B�ֻּP�~�˥������áC�P�§A�̤@���ۦ�5566��C��q�g�b�߸̳̭��n���a��C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b30773','����ѱM��G�H�͵L�����q',650,'CD','[ �H�͵L�����q ] Life Live ���y���t55����122���A ���Ч��㦬�����t���֥�����C 3CD 36���q�A���F [ ���㦬���g ] ���t�۷|���إ~�A�󦳦U�a�����q�s�P�D�ޡA���ӥX�t��M�� [ �n�ͥ[�Z�g ]�C ���q��. ���L��. ���̪L. �����s. ���a�E. ù�Ӳ�. �i��â. �d�v��. �ڶ��t. GLAY TERU. �Q�쥨�P�P420�U����������X�ۡC �o�Ǻ����������Ȫ��@�~�A�����b Life Live �̡A�����L���H�͸̡A�̰ʤH���۶ǽg���C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b20776','���̪L�M��G�APlay',600,'CD','���i�P�ɵn�W����m�ɥN���x�n�x���B�[���j�mCMB�n�������x�B��Z���mGQ�n���x���� �D�w �ڦ� �k�� ����, �Jù�J��ȵ���ڶǴC���ˤ��� 2014���y���ָ��D�Q�׫׳̰��ػy�~�׬y������M��! ���@�n�A ���D���Y ��گŻ��غXĥ�� CD+DVD �W�Ȧ����w��8�Ӥ�Ӹ�5�d�U[���@�k�D]���D��9��MV���ֿ��v�aDVD+ ��V�j����󤤦�50�զ��ܳy�� [2015�����H�ͼg�u�g��]');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b20778','���̪L�M��G�ό��',450,'CD','�v�W�̻��إ��˱M��ACD+DVD�۷N���m �����x�e����o�D �T�Y���u�p�⥴�y �@�~���i���O�I�X  10���s/�����֫~�� �H�ό��JOLIN���Ч@�ի�  �ػy��Hit��/�s�@�H�j���X   �зN�}�ɪ�}�u��I ���۷N���mBonus DVD �yDANCE with JOLIN�z JOLIN���u����F��⩤�i���]���S�V�A�G�j��HIT�W�vJonte�BBobby Newberry�˦۱оǡA�E��ģ������A����R�Ъ�MV�������K���áI');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('F95191','�հհ�',100,'DVD','���@���S�@���W���зN����q�A����Ĥl�b���֤��ǲߡA��C���������C\n �ⳡ���ʧ@�P�j�����o�|���ۭ��n���pô�A��j���o���״I������A�Ĥl�۵M�|�o���B���F�A��ǹ�����ܡA��������ʹ�Ĥl�y���B��ı�Bťı�BĲı���o�i�����ܤj���U�q�C\n ���~�A�z�L���йC�����m�ߡA�Ĥl�|�������o�u���ݡv�P�u�x���ɾ��v�A�ӨC����������q���P�ʧ@�����K���t�X�A�Ĥl�|�b���ۤ��E�o�X�Q���O�P�гy�O�C������M�Ĥl�@�P���ۤ�����ɡA�z�L�y���B�����P���骺��Ĳ�A�ٯ���i�X���Ϊ��ˤl�q���C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('W42957','�u�R�@��',300,'BOOK','�C�ӱB�ó��ݭn�g��P���i�C���ҩd�Ө��A�N�ɶ��κ�O���󦹡A�O�̦����Ȫ��C���W�ʸU�H����ҩ��A�S���ƻ��إ߱B�ç�����ί��ܻy����h�C\n ���ѬO����̨Ϊ��B�ëŨ��A�䤤�H�t�g����¦���[�I�A�O�C�@��w�q�B�B�Τw�i�J�B�ê��k�k�̨Ϊ���ܡA����j�ƨC�@��ҩd���������Y�C�q���Ѥ��M�䴼�z�A����ϧA�b�B�ä���P���򪺦��\�C');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('A13863','MIS',800,'BOOK','�H�u���z�B���p���B�j�ƾڡB���Ĭ�ޡB�϶��쵥��IT���s��ަb2017�~�H��v���ѹ���Ǩ��X�A�i�J�F�ӷ~��������Զ��q�CAI���۾r���B���z�U�z�B��Ѿ����H�B�u�~�����H�BAI�����BAI���ġBAI�w���BAI�k�߾Q�ѻ\�a�a�����F�ǲβ��~�A�\�h�M�a�w��10�~�����i��H����50%���u�@�N�QAI�Ҩ��N�C��MAI�p�G�A�f�t���p���B�j�ƾڡB���ݤ�5G�H���O�p��K�l�B½���Цa�B�U���i�סCMIS�H���p��Φ��a�w���B�ǳơA�άO�p�󵽥[�Q�γo�ǪZ����M�O�@�ӫD�`���n��ĳ�D�C\n �Ӧb���~�g����t�譱�A2018�~���y���ȳ̰����e�C�j���q�]�Aī�G�B���q�B�L�n�B�Ȱ����B�y�ѡB�˰T�P�����ڤڡA�@�߳��O���x�����g��Ҧ��A�����S���D�ɲ��~���s�y�P�c��A�u�O���Ѥ@�Ӥj�a�@�s�@�a�����x�C�o�غ����g����t�U�A�S�����B�D�`���\���g��Ҧ��A���ӱN�|�O���~�D�y���g��Ҧ��C���x�g����t�U���C���W�h�B�v�������B��´���c�B�귽�t�ΡB���q�Ҧ��A���P�ǲΪ����~���D�`�j�����P�A���o�إ��ӥD�y���g��Ҧ��AMIS�H����M���Ӳ`�J���h�A�ѡC�]���������睊���I�]�A�G���s���g�T�ӳ��`�A(1)�H�u���z���޳N�B���λP�����A(2)���x�g����t�A(3)���x�g��Ҧ��P�v�������C���~�]�[�g�F���p���B���Ĭ�ޡB�϶���B5G�B���z��P�B�s�s��κ����g�ٵ��̷s�����e�A�Ʊ��b�̪񷥬��ֳt�ܰʪ�������ҤU�A����MIS�P�n�@���i�H��W�ɥN���Ь�ѡC');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('v10888','���Q�i�S�G�V����l���I�q',500,'CD','�p�G�n�����Q�i�S��X�ۤv�b�N��د����̰Q�����@���ҡA�u�]�ľǡv����W�C�e�T�C�߶}���~�H�ӻP�ۤ��R�бª����象���A�L�����Z�]�l�צb�ή���t�ä�C�ҥH�N��ɤW�F���~�šA���F�s���]�ľǱб¡A���Q�]�����ݦۤv����o�h�j�i�B�C����L���M�o��@�����O�A���_�ݦa����@���I�z�L�󰪮Ī��]�Ļs�@��k�B�ҥ��S�Ъ����_�G�y�A�o���p�W�u�V����l�v�����O�������L����{�W�V���R�A�����L���]�ľǦ��F���s���{�ѡC\n ���ަp���A���s�u�V����l�v���u�ꨭ���o���O���Q����Ȥ���A���󭢤����ϩR�����ݵۥL�C��a�]�b���h�O�q���e�A���g��ۤv���F������C���A�䤤�����Q�äJ�F�i�H�x�s�]�k���u���F��v�����C�p�����Q�����P�H���Q�h���X�@�A�N�����U�B�����F��ɼƺR���A�~������������]���C\n ���b�p�e���\���e�A�ɶ����Ȥ����b���Q�o��C�]�k�����h���{�v�O�󭡡A���b�t�B�������H���������ʡA�N�s�N��د��]���A�w���F�C���K�P�q�ҡA�����P�I�q�A�@���e�ҥ��������ɧY�N�]������]�k�@�ɡC���Q�����n�ԷV��ܦۤv�����͡A�]���L����A���w���H�Q�O�W�F�ݩ��a�]���u���]�аO�v�K�K');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b30999','��Ʈw�z�׻P���',500,'BOOK','���Ѳ[�\�F��ȤW�`�Ϊ���Ʈw�z�סA�����ӤɾǪ̥��ƱХ��C\n �]�����ݬ�ު��o�i�A�j�ơu���ݹB��P��Ʈw�v�@���A���F�y�z�������ҤU��ƪ����A�M���c�~�A����~�ӷU�ӷU���M��NoSQL��Ʈw�]���F���СA�ר�w��ثe�̬y�檺NoSQL��ƮwMongoDB���F�۷���骺�����C\n �H�P�@�ӽd�ҡ]�����ѩ����u�W�ʪ��t�Ρ^�e����Ѩӻ�����Ʈw�����n�[���A�P�ɴ��Ѧh�ӽd�ҵ{���U���Ψt�Τ䴩��Ƚm�ߡA������s�uWeb�{���y���M��Ʈw���Ρv�@���̪��{���d�ҥH�ϬM�̷s���{�������A���Ѭ����Ӻ���Ʈw�̥�Ū���y�C\n ���ѡu���s�����ѩ��v�d�Ҩt�ΡA��Ū�̥i�H�����A�ѨC�@�����Ψt�Ϋ᭱��Ʈw���ܤƱ��ΡA���Ѧ�200 �l�i�Ϫ�A��Ū�̧�e���z�Ѭ��������A�æ��״I���m���D�M���D�A�䤤���j�����O�t���D�A���U�j��Ū�̦b��Ʈw�]�p�����ί�O�C\n ���ѱM�ݺ������ҵ{��v���B�����ѩ��d�Ҩt�ΡBSQL�y�k�m�ߡB�m���D�M���D�ѵ��B�d�ҵ{���U���B��Ʈw�����귽�B�Q�ת����A�����󴣨ѨC�����v���ɩM�e�K���C�����ҫ�����D�A�����̤]���ѽm���D�ѵ��B�����D�ѵ��M�������D�ѵ��A�O�Юv�»P�ǥͬ�ߪ��̨Ϋ�ޡC');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b20777','���̪L�M��G',350,'CD','���Ǥ��� �����Ӧ�\n ���}�@�U�зǪ��f���[  �]�e�j�d�@�ɪ��c�P��\n �Ȭw�y��ѦZ ���̪L JOLIN�̷s�M�� UGLY BEAUTY\n 11�����F�����۰ݦ۵�  �̸۹ꪺ�p�K���֤�O');
Insert into GROUP11.PRODUCT (PID,PNAME,PRICE,CATEGORY,PDESC) values ('b51111','�q�l�ӰȲz�׻P���',700,'BOOK','�U�g�����D�D���ܲŦX�ثe���z�q�l�ӰȪ����ҡA��s�]������`�p���ǳN�z�׻P���ȡA�ǳN�ʪ��Y�Ԥ��e�N�ӥi�ೣ�|�b�������ǳN���Z�o�i�A���O���ѹ��ե��H�`�J�L�X���覡�A���D�M�~��Ū�̤]����A�Ѭ�s���o�{�C');
REM INSERTING into GROUP11.RECORD
SET DEFINE OFF;
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (1,'b51111',3,700,2100);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (1,'d03333',5,450,2250);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (2,'W42957',3,300,900);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (2,'b10234',1,600,600);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (3,'d11222',3,300,900);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (3,'v00111',1,400,400);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (4,'N41023',2,400,800);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (5,'b20777',2,350,700);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (6,'b40555',2,550,1100);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (7,'v00111',3,400,1200);
Insert into GROUP11.RECORD (TNO,PID,AMOUNT,SALEPRICE,TOTAL) values (8,'F95191',1,100,100);
--------------------------------------------------------
--  DDL for Trigger MEMBER_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "GROUP11"."MEMBER_TRG" 
BEFORE INSERT ON member  
FOR EACH ROW  
BEGIN  
IF :new.mid IS NULL THEN  
SELECT member_mid_seq.nextval INTO :new.mid FROM dual;  
END IF;  
END;

/
ALTER TRIGGER "GROUP11"."MEMBER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDER_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "GROUP11"."ORDER_TRG" 
BEFORE INSERT ON order_list  
FOR EACH ROW  
BEGIN  
IF :new.oid IS NULL THEN  
SELECT order_oid_seq.nextval INTO :new.oid FROM dual;  
END IF;  
END;

/
ALTER TRIGGER "GROUP11"."ORDER_TRG" ENABLE;

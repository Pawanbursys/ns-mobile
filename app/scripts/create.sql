DROP TABLE IF EXISTS mail_segment;

CREATE TABLE mail_segment (
  SEGMENT_ID int(11) NOT NULL primary key,
  AFFIXED_POSTAGE_ID int(11) DEFAULT NULL,
  SM_SEGMENT_ID int(11) DEFAULT NULL,
  SITE_ID int(11) DEFAULT NULL,
  CUSTOMER_PROFILE_ID int(11) NOT NULL,
  MAILING_ID int(11) NOT NULL,
  SORTER_ID int(11) NOT NULL,
  SORTER_SCHEME_ID int(11) NOT NULL,
  PRINT_JOB_NAME varchar(100)   DEFAULT ' ',
  READER_SW_VERSION varchar(20)   DEFAULT NULL,
  EST_PCS int(11) DEFAULT NULL,
  SCAN_TYPE int(11) DEFAULT NULL,
  WO_ITEM_ID int(11) DEFAULT NULL,
  TRANSFER_ID int(11) DEFAULT NULL,
  IS_AUTO_PROFILE varchar(1)   DEFAULT NULL,
  STG_SEQUENCE_NUM bigint(20)  DEFAULT NULL
);


DROP TABLE IF EXISTS mail_run;

CREATE TABLE mail_run (
  RUN_ID int(11) NOT NULL primary key,
  SORT_MODE_ID int(11) NOT NULL,
  SM_RUN_ID int(11) DEFAULT NULL,
  SEGMENT_ID int(11) NOT NULL,
  START_TIME datetime DEFAULT NULL,
  SHIFT_ID int(11) DEFAULT NULL,
  END_TIME datetime DEFAULT NULL,
  TOTAL_FED int(11) DEFAULT NULL,
  TOTAL_SORTED int(11) DEFAULT NULL,
  TOTAL_REJECTED int(11) DEFAULT NULL,
  DATE_ZIP_4_DB varchar(100)   DEFAULT NULL,
  TRANSFER_ID int(11) DEFAULT NULL,
  STG_SEQUENCE_NUM bigint(20) DEFAULT NULL,
  NCOA_RUN_ID varchar(32)   DEFAULT NULL,
  NCOA_PSR blob,
  USER_ID int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS mail_piece;

CREATE TABLE mail_piece (
  MAIL_PIECE_ID bigint(20) NOT NULL primary key,
  SORT_DECISION_ID int(11) DEFAULT NULL,
  RUN_ID int(11) NOT NULL,
  SM_MAIL_PIECE_ID int(11) DEFAULT NULL,
  AUTO_MACH_ID int(11) DEFAULT NULL,
  SCHEME_BIN_TYPE_ID int(11) DEFAULT NULL,
  SCS_DOCUMENT_REF int(11) DEFAULT NULL,
  POSTAGE_WEIGHT float DEFAULT NULL,
  BIN_NUMBER int(11) DEFAULT NULL,
  PIECE_TIME datetime DEFAULT NULL,
  THICKNESS float DEFAULT NULL,
  LENGTH decimal(8,4) DEFAULT '0.0000',
  WIDTH decimal(8,4) DEFAULT '0.0000',
  HEIGHT decimal(8,4) DEFAULT '0.0000',
  DIM_WEIGHT decimal(8,4) DEFAULT '0.0000',
  USPS_ZONE int(11) DEFAULT '0',
  VOLUME_TIER int(11) DEFAULT '0',
  IMPB_construct_type varchar(5)   DEFAULT NULL,
  ZIP varchar(20)   DEFAULT NULL,
  PLANET_CODE varchar(100)   DEFAULT NULL,
  POSTNET_CODE varchar(100)   DEFAULT NULL,
  SORT_LEVEL int(11) DEFAULT NULL,
  ACTUAL_BIN_NUMBER int(11) DEFAULT NULL,
  ACTUAL_WEIGHT float DEFAULT NULL,
  OUT_OF_SCHEME int(11) DEFAULT NULL,
  CB_CODE varchar(50)   DEFAULT NULL,
  FAST_FORWARD_HIT int(11) DEFAULT NULL,
  READER_SW_VERSION varchar(10)   DEFAULT NULL,
  INDICIA varchar(50)   DEFAULT NULL,
  ARBITRATION_DESCRIPTION varchar(512)   DEFAULT NULL,
  READER_DIRECTORY_DATE datetime DEFAULT NULL,
  ACTION_PERFORMED varchar(255)   DEFAULT NULL,
  SABRE_PLUS int(11) DEFAULT NULL,
  SUBMAIL_TYPE_ID int(11) DEFAULT NULL,
  BIN_SWITCH int(11) DEFAULT NULL,
  STG_SEQUENCE_NUM bigint(20)   DEFAULT NULL,
  STATUS int(11) DEFAULT NULL,
  LABEL_APPLIED bit(1) DEFAULT NULL,
  OCR_READ bit(1) DEFAULT NULL,
  ENDORSED bit(1) DEFAULT NULL,
  SKEW_DETECTED bit(1) DEFAULT NULL,
  BARCODED bit(1) DEFAULT NULL,
  DOUBLE_DETECTED bit(1) DEFAULT NULL,
  REM_MAIL_TYPE varchar(20)   DEFAULT NULL,
  PRINT_VERIFIED bit(1) DEFAULT NULL,
  TAG_DATA varchar(100)   DEFAULT NULL,
  USPS_TAG_ID varchar(50)   DEFAULT NULL,
  REJECTED bit(1) DEFAULT  '0',
  SORT_CODE varchar(20)   DEFAULT NULL,
  HUMAN_READABLE_TEXT varchar(100)   DEFAULT NULL,
  RTS_REASON_CODE varchar(10)   DEFAULT NULL,
  FIM_TYPE varchar(10)   DEFAULT NULL,
  DPV_FLAG varchar(2)   DEFAULT NULL,
  LACS_FLAG varchar(2)   DEFAULT NULL,
  SUITE_FLAG varchar(1)   DEFAULT NULL,
  RR_FLAG varchar(1)   DEFAULT NULL,
  HI_RISE_FLAG varchar(1)   DEFAULT NULL,
  EWS_FLAG varchar(1)   DEFAULT NULL,
  COA_SOURCE varchar(1)   DEFAULT NULL,
  IMG_NUM_F varchar(200)   DEFAULT NULL,
  IMG_NUM_B varchar(20)   DEFAULT NULL,
  IS_IMG_NEW bit(1) DEFAULT NULL,
  FALSE_POSITIVE varchar(200)   DEFAULT NULL,
  MRLN_ENABLED bit(1) DEFAULT  '0',
  MRLN_TEST_ABORTED bit(1) DEFAULT NULL,
  MRLN_PASS_PERCENT float DEFAULT NULL,
  MRLN_TAG varchar(10)   DEFAULT NULL,
  MATCH_BACK_CODE varchar(320)   DEFAULT NULL,
  ADDR_BLOCK_IMB varchar(35)   DEFAULT NULL,
  STD_USPS_ADDR varchar(100)   DEFAULT NULL,
  FIRM_NAME varchar(100)   DEFAULT NULL,
  MS_MAIL_TYPE_ID int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS mail_mailing;
CREATE TABLE mail_mailing (
  MAILING_ID int(11) NOT NULL DEFAULT '0',
  PARENT_MAILING_ID int(11) DEFAULT NULL,
  NAME varchar(100)  DEFAULT NULL,
  REPORT_BATCH_ID int(11) DEFAULT NULL,
  MAILING_STATUS_ID int(11) NOT NULL DEFAULT '1',
  PRODUCT_ID int(11) NOT NULL,
  BIZ_ENTITY_ID int(11) DEFAULT NULL,
  ANALYSIS_TEMPLATE_ID int(11) DEFAULT NULL,
  IS_COMPLETE int(11) DEFAULT NULL,
  DROPSHIP_GROUP_ID int(11) DEFAULT NULL,
  PALLET_SCHEME_ID int(11) DEFAULT NULL,
  MAILING_DATE datetime DEFAULT NULL,
  SORTER_CONFIG_GROUP_ID int(11) DEFAULT NULL,
  IS_TEMPLATE bit(1) DEFAULT NULL,
  ENABLE_FULL_SERVICE bit(1) DEFAULT NULL,
  RECORD_STATUS int(11) DEFAULT NULL,
  TRANSFER_ID int(11) DEFAULT NULL,
  DELETED_ON datetime DEFAULT NULL,
  CREATED_BY varchar(100)  DEFAULT NULL,
  CREATED_ON datetime DEFAULT NULL,
  LAST_UPDATED_BY varchar(100)  DEFAULT NULL,
  LAST_UPDATED_ON datetime DEFAULT NULL,
  IS_USPS bit(1) DEFAULT '0',
  IS_COPALENABLE bit(1) DEFAULT '0',
  USPS_REPORT_STATUS varchar(20)  DEFAULT NULL,
  JOB_ID varchar(30)  DEFAULT NULL
);

DROP TABLE IF EXISTS anl_analysis;
CREATE TABLE anl_analysis (
  ANALYSIS_ID int(11) NOT NULL primary key,
  ANALYSIS_GROUP_ID int(11) DEFAULT NULL,
  ANALYSIS_TYPE_ID int(11) DEFAULT NULL,
  PRODUCT_ID int(11) DEFAULT NULL,
  DESCRIPTION varchar(100) DEFAULT NULL,
  SORT_LEVEL_ID int(11) NOT NULL,
  SORT_WITHIN_GROUPS int(11) DEFAULT NULL,
  PCS_TRAY_TAG int(11) DEFAULT NULL,
  NUM_BINS_SECOND_PASS int(11) DEFAULT NULL,
  MIN_PCS_MAILING int(11) DEFAULT NULL,
  ENABLE_SEQUENTIAL bit(1) DEFAULT NULL,
  AM_QUALIFY_3D_QTY int(11) DEFAULT NULL,
  AM_QUALIFY_5D_QTY int(11) DEFAULT NULL,
  AM_QUALIFY_AADC_QTY int(11) DEFAULT NULL,
  NAM_QUALIFY_3D_QTY int(11) DEFAULT NULL,
  NAM_QUALIFY_5D_QTY int(11) DEFAULT NULL,
  NAM_QUALIFY_AADC_QTY int(11) DEFAULT NULL,
  ORIGINATING_ZIPCODE varchar(10) DEFAULT NULL,
  ENABLE_GROUP_AADC_3D bit(1) DEFAULT NULL,
  ENABLE_GROUP_MIXED_AADC bit(1) DEFAULT NULL,
  ENABLE_ANALYZE_EACH_SUBMAILING bit(1) DEFAULT NULL,
  ENABLE_OPTIMIZE_USING_MULTI_BINS bit(1) DEFAULT NULL,
  ENABLE_DROP_SHIP bit(1) DEFAULT NULL,
  ENABLE_MACH_DROP_SHIP bit(1) DEFAULT NULL,
  ENABLE_DONOT_COMBINE_AADC_BINS bit(1) DEFAULT NULL,
  IS_TEMPLATE bit(1) DEFAULT NULL,
  RECORD_STATUS int(11) NOT NULL DEFAULT '0',
  CREATED_BY varchar(10) DEFAULT NULL,
  CREATED_ON datetime DEFAULT NULL,
  LAST_UPDATED_BY varchar(10) DEFAULT NULL,
  LAST_UPDATED_ON datetime DEFAULT NULL,
  USPS_CITYSTATECYCLEDATE datetime DEFAULT NULL,
  ENABLE_BUNDLES bit(1) DEFAULT NULL,
  COMBINE_BIN_LIMIT int(11) NOT NULL DEFAULT '1',
  REPASS_HANDLING int(11) NOT NULL DEFAULT '0',
  IS_NORMAL bit(1) DEFAULT '0',
  IS_AUDIT bit(1) DEFAULT '0',
  MAIL_STAGING int(11) NOT NULL DEFAULT '0',
  ENABLE_SUBMAILING_ANALYSIS bit(1) DEFAULT NULL,
  ENABLE_FORM_GROUPS_FROM_SEQUENTIAL_BINS bit(1) DEFAULT NULL,
  ENABLE_DROP_SHIP_ORDERING bit(1) DEFAULT NULL,
  ENABLE_BASIC_SERVICE_ONLY bit(1) DEFAULT NULL,
  MIN_POUNDS_PER_DIRECT_SACK int(10) NOT NULL DEFAULT '0',
  MIN_POUNDS_PER_MXD_COUNTRY_SACK int(11) NOT NULL DEFAULT '0',
  ENABLE_DROP_MXD_NDC bit(1) DEFAULT NULL,
  ENABLE_GROUP_SCHEMES bit(1) DEFAULT NULL,
  PUSH_GRP_SCHEMES bit(1) DEFAULT '1',
  Enable_Sorting_AADC_2SCF bit(1) DEFAULT '1',
  TRANSFER_ID int(11) NOT NULL DEFAULT '0',
  Enable_Remove_failed_minimum_mail bit(1) DEFAULT '0',
  AM_QUALIFY_3D_WT float DEFAULT NULL,
  AM_QUALIFY_5D_WT float DEFAULT NULL,
  AM_QUALIFY_AADC_WT float DEFAULT NULL,
  SINGLE_PIECE int(11) DEFAULT NULL,
  SELECTED_SINGLE_PIECE int(11) DEFAULT NULL,
  enable_SinglePiece_Mode bit(1) DEFAULT NULL,
  MIN_PCS_TRAY int(11) DEFAULT '0',
  AM_QUALIFY_FSS_QTY int(11) DEFAULT '0',
  NAM_QUALIFY_FSS_QTY int(11) DEFAULT '0',
  AM_QUALIFY_SCF_WT float DEFAULT '0',
  AM_QUALIFY_NDC_WT float DEFAULT '0',
  AM_QUALIFY_SCF_QTY int(11) DEFAULT '0',
  AM_QUALIFY_NDC_QTY int(11) DEFAULT '0',
  MACH_QUALIFY_5D_WT float DEFAULT '0',
  MACH_QUALIFY_SCF_WT float DEFAULT '0',
  IRREG_QUALIFY_NDC_WT float DEFAULT '0',
  MACH_QUALIFY_NDC_WT float DEFAULT '0',
  IRREG_QUALIFY_5D_WT float DEFAULT '0',
  IRREG_QUALIFY_SCF_WT float DEFAULT '0'
  );

DROP TABLE IF EXISTS anl_virtual_pallet;
CREATE TABLE anl_virtual_pallet (
  VIRTUAL_PALLET_ID int(11) NOT NULL primary key ,
  ANALYSIS_ID int(11) DEFAULT NULL,
  DEST_ZIP varchar(20) DEFAULT NULL,
  DEST_LINE1 varchar(100) DEFAULT NULL,
  DEST_LINE2 varchar(100) DEFAULT NULL,
  USER_INFO varchar(500) DEFAULT NULL,
  PALLET_INFO_ID int(11) DEFAULT NULL,
  DEST_ZIP_CODES varchar(1500) DEFAULT NULL,
  MIN_LOAD_CONTAINER int(10)  NOT NULL DEFAULT '0',
  LINEAR_FEET int(10)  NOT NULL DEFAULT '0',
  DROPSHIP_ID int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS anl_virtual_tray;
CREATE TABLE anl_virtual_tray (
  VIRTUAL_TRAY_ID int(11) NOT NULL primary key ,
  VIRTUAL_PALLET_ID int(11) DEFAULT NULL,
  VIRTUAL_DROP_SHIP_ID int(11) DEFAULT NULL,
  TRAY_TYPE_ID int(11) DEFAULT NULL,
  ANALYSIS_ID int(11) DEFAULT NULL,
  RATE_CATEGORY_ID int(11) DEFAULT NULL,
  AUTO_MACH_ID int(11) DEFAULT NULL,
  CONTAINER_TYPE_ID int(11) DEFAULT NULL,
  TRAY_DEST_REF int(11) DEFAULT NULL,
  PIECE_COUNTS int(11) DEFAULT NULL,
  THREE_D_TRAY_DEST_ZIP varchar(10) DEFAULT NULL,
  DEST_LABEL varchar(100) DEFAULT NULL,
  SCHEME_SUB_TYPE varchar(20) DEFAULT NULL,
  TRAY_DEST_ZIP varchar(20) DEFAULT NULL,
  IS_SCHEME_ZIP bit(1) DEFAULT '0',
  ACTUAL_WEIGHT float DEFAULT NULL
);

DROP TABLE IF EXISTS log_container_scan;
CREATE TABLE log_container_scan (
  CONTAINER_SCAN_ID int(11) NOT NULL primary key ,
  EVENT_TYPE_ID int(11) DEFAULT NULL,
  TRAY_TAG_TYPE_ID int(11) DEFAULT NULL,
  CONTAINER_TYPE_ID int(11) DEFAULT NULL,
  PARENT_CONTAINER_SCAN_ID int(11) DEFAULT NULL,
  MAILING_ID int(11) DEFAULT NULL,
  SCAN_TEXT varchar(100) DEFAULT NULL,
  PARENT_SCAN_TEXT varchar(100) DEFAULT NULL,
  GROSS_WEIGHT float DEFAULT NULL,
  NET_WEIGHT float DEFAULT NULL,
  CONT_SIZE int(11) DEFAULT NULL,
  PALLET_LOCATION varchar(10) DEFAULT NULL,
  DNR_BARCODE varchar(20) DEFAULT NULL,
  FLIGHT_INFO varchar(10) DEFAULT NULL,
  SCAN_TIME datetime DEFAULT NULL,
  CREATED_ON datetime DEFAULT NULL,
  CREATED_BY varchar(50) DEFAULT NULL,
  UPDATED_ON datetime DEFAULT NULL,
  UPDATED_BY varchar(50) DEFAULT NULL,
  VALIDATE_RESULT varchar(50) DEFAULT NULL,
  PALLET_STATUS varchar(1) DEFAULT NULL,
  TRAY_SCAN_SEQUENCE varchar(1) DEFAULT NULL,
  Job_ID varchar(10) DEFAULT NULL,
  Container_ID int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS log_pallet_tag;
CREATE TABLE log_pallet_tag (
  PALLET_TAG_ID int(11) NOT NULL primary key,
  PALLET_TYPE_ID int(11) DEFAULT NULL,
  MAILING_ID int(11) DEFAULT NULL,
  VIRTUAL_PALLET_ID int(11) DEFAULT NULL,
  SERIAL_NUMBER int(11) DEFAULT NULL,
  DEST_ZIP varchar(20) DEFAULT NULL,
  BARCODE_COMPLETE varchar(50) DEFAULT NULL,
  IS_FROM_SCHEME bit(1) DEFAULT NULL,
  DEST_LINE1 varchar(100) DEFAULT NULL,
  DEST_LINE2 varchar(100) DEFAULT NULL,
  DEST_LINE3 varchar(100) DEFAULT NULL,
  BARCODE_IMAGE_FILE varchar(100) DEFAULT NULL,
  CREATED_ON datetime DEFAULT NULL,
  CREATED_BY varchar(50) DEFAULT NULL,
  DEST_ZIP_CODES varchar(500) DEFAULT NULL,
  USER_INFO varchar(500) DEFAULT NULL,
  PALLET_POSITION varchar(100) DEFAULT NULL,
  TRAY_TAG_ORIGIN varchar(100) DEFAULT NULL,
  DROPSHIP_ID int(11) DEFAULT NULL,
  PALLET_INFO_ID int(11) DEFAULT NULL
  );

DROP TABLE IF EXISTS log_tray_tag;
CREATE TABLE log_tray_tag (
  TRAY_TAG_ID int(11) NOT NULL primary key,
  VIRTUAL_TRAY_ID int(11) DEFAULT NULL,
  TRAY_TAG_MODE_ID int(11) NOT NULL,
  TRAY_TAG_DATA_ID int(11) NOT NULL,
  SERIAL_NUMBER int(11) DEFAULT NULL,
  BARCODE_COMPLETE varchar(100) DEFAULT NULL,
  STG_SEQUENCE_NUM bigint(20) DEFAULT NULL,
  TRANSFER_ID int(11) DEFAULT NULL,
  RECORD_STATUS int(11) DEFAULT '0',
  SORTER_ID int(11) DEFAULT NULL,
  PALLET_INFO_ID int(11) DEFAULT NULL,
  MAILING_ID int(11) DEFAULT NULL,
  PALLET_LOCATION varchar(20) DEFAULT NULL,
  DROP_SHIP_TYPE_ID int(11) DEFAULT NULL,
  BIN_NUMBER int(11) DEFAULT NULL,
  SORTER_SCHEME_ID int(11) DEFAULT NULL,
  TRAY_TAG_TYPE_ID int(11) DEFAULT NULL,
  SORTER_SCHEME_REF varchar(10) DEFAULT NULL,
  DEST_ZIP varchar(20) DEFAULT NULL,
  CIN varchar(10) DEFAULT NULL,
  MID_NUM varchar(10) DEFAULT NULL,
  GENERATED_ON datetime DEFAULT NULL,
  CREATED_BY varchar(50) DEFAULT NULL,
  IS_EXTERNAL bit(1) DEFAULT NULL
);

DROP TABLE IF EXISTS log_tray_tag_data;
CREATE TABLE log_tray_tag_data (
  TRAY_TAG_DATA_ID int(11) NOT NULL primary key,
  SORTER_SCHEME_ID int(11) NOT NULL,
  TRAY_TAG_TYPE_ID int(11) DEFAULT NULL,
  MAILING_ID int(11) NOT NULL,
  SORTER_ID int(11) DEFAULT NULL,
  PALLET_INFO_ID int(11) DEFAULT NULL,
  PALLET_LOCATION varchar(20) DEFAULT NULL,
  DROP_SHIP_TYPE_ID int(11) DEFAULT NULL,
  DEST_ZIP varchar(20) DEFAULT NULL,
  CIN varchar(10) DEFAULT NULL,
  MID_NUM varchar(10) DEFAULT NULL,
  GENERATED_ON datetime DEFAULT NULL,
  BIN_NUMBER int(11) DEFAULT NULL,
  RECORD_STATUS int(11) DEFAULT '0',
  IS_FROM_SCHEME bit(1) DEFAULT '0',
  TRANSFER_ID int(11) DEFAULT NULL,
  TAG_COUNT int(11) DEFAULT NULL,
  VIRTUAL_TRAY_ID int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS mach_sorter;
CREATE TABLE mach_sorter (
  SORTER_ID int(11) NOT NULL primary key ,
  MID_ID int(11) DEFAULT NULL,
  SORTER_VENDOR_ID int(11) DEFAULT NULL,
  IS_THIRD_PARTY bit(1) DEFAULT '0',
  SORTER_TYPE_ID int(11) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  SERIAL_NUMBER varchar(50) DEFAULT NULL,
  SORTER_NUMBER varchar(10) DEFAULT NULL,
  HARDWARE_KEY varchar(100) DEFAULT NULL,
  BINCOUNT int(11) DEFAULT NULL,
  SERVICE_TAG_NUMBER varchar(100) DEFAULT NULL,
  VIRTUAL_SORTER_REF int(11) DEFAULT NULL,
  PLATFORM_ID varchar(50) DEFAULT NULL,
  TRANSFER_ID int(11) DEFAULT NULL,
  JMS_Q_NAME varchar(50) DEFAULT NULL,
  SORTER_IP_ADDRESS varchar(50) DEFAULT NULL,
  IS_REGISTERED int(11) NOT NULL DEFAULT '0',
  OLD_SORTER_ID int(11) DEFAULT NULL,
  REGISTERED_DATE datetime DEFAULT NULL,
  RECORD_STATUS int(11) DEFAULT NULL,
  CREATED_BY varchar(50) DEFAULT NULL,
  MLOCR_SERIAL varchar(50) DEFAULT '00-0000',
  DATABASE_TYPE int(11) DEFAULT '1',
  TRAY_TAG_PRINTER_ADDRESS varchar(15) DEFAULT NULL,
  MACH_BIN_TYPE int(11) DEFAULT '2',
  TAGS_CREATED int(11) DEFAULT '0',
  PAC_ACTIVE bit(1) DEFAULT NULL
);

DROP TABLE IF EXISTS mail_piece;
CREATE TABLE mail_piece (
  MAIL_PIECE_ID bigint(20)  NOT NULL primary key,
  SORT_DECISION_ID int(11) DEFAULT NULL,
  RUN_ID int(11) NOT NULL,
  SM_MAIL_PIECE_ID int(11) DEFAULT NULL,
  AUTO_MACH_ID int(11) DEFAULT NULL,
  SCHEME_BIN_TYPE_ID int(11) DEFAULT NULL,
  SCS_DOCUMENT_REF int(11) DEFAULT NULL,
  POSTAGE_WEIGHT float DEFAULT NULL,
  BIN_NUMBER int(11) DEFAULT NULL,
  PIECE_TIME datetime DEFAULT NULL,
  THICKNESS float DEFAULT NULL,
  LENGTH decimal(8,4) DEFAULT '0.0000',
  WIDTH decimal(8,4) DEFAULT '0.0000',
  HEIGHT decimal(8,4) DEFAULT '0.0000',
  DIM_WEIGHT decimal(8,4) DEFAULT '0.0000',
  USPS_ZONE int(11) DEFAULT '0',
  VOLUME_TIER int(11) DEFAULT '0',
  IMPB_construct_type varchar(5) DEFAULT NULL,
  ZIP varchar(20) DEFAULT NULL,
  PLANET_CODE varchar(100) DEFAULT NULL,
  POSTNET_CODE varchar(100) DEFAULT NULL,
  SORT_LEVEL int(11) DEFAULT NULL,
  ACTUAL_BIN_NUMBER int(11) DEFAULT NULL,
  ACTUAL_WEIGHT float DEFAULT NULL,
  OUT_OF_SCHEME int(11) DEFAULT NULL,
  CB_CODE varchar(50) DEFAULT NULL,
  FAST_FORWARD_HIT int(11) DEFAULT NULL,
  READER_SW_VERSION varchar(10) DEFAULT NULL,
  INDICIA varchar(50) DEFAULT NULL,
  ARBITRATION_DESCRIPTION varchar(512) DEFAULT NULL,
  READER_DIRECTORY_DATE datetime DEFAULT NULL,
  ACTION_PERFORMED varchar(255) DEFAULT NULL,
  SABRE_PLUS int(11) DEFAULT NULL,
  SUBMAIL_TYPE_ID int(11) DEFAULT NULL,
  BIN_SWITCH int(11) DEFAULT NULL,
  STG_SEQUENCE_NUM bigint(20)  DEFAULT NULL,
  STATUS int(11) DEFAULT NULL,
  LABEL_APPLIED bit(1) DEFAULT NULL,
  OCR_READ bit(1) DEFAULT NULL,
  ENDORSED bit(1) DEFAULT NULL,
  SKEW_DETECTED bit(1) DEFAULT NULL,
  BARCODED bit(1) DEFAULT NULL,
  DOUBLE_DETECTED bit(1) DEFAULT NULL,
  REM_MAIL_TYPE varchar(20) DEFAULT NULL,
  PRINT_VERIFIED bit(1) DEFAULT NULL,
  TAG_DATA varchar(100) DEFAULT NULL,
  USPS_TAG_ID varchar(50) DEFAULT NULL,
  REJECTED bit(1) DEFAULT '0',
  SORT_CODE varchar(20) DEFAULT NULL,
  HUMAN_READABLE_TEXT varchar(100) DEFAULT NULL,
  RTS_REASON_CODE varchar(10) DEFAULT NULL,
  FIM_TYPE varchar(10) DEFAULT NULL,
  DPV_FLAG varchar(2) DEFAULT NULL,
  LACS_FLAG varchar(2) DEFAULT NULL,
  SUITE_FLAG varchar(1) DEFAULT NULL,
  RR_FLAG varchar(1) DEFAULT NULL,
  HI_RISE_FLAG varchar(1) DEFAULT NULL,
  EWS_FLAG varchar(1) DEFAULT NULL,
  COA_SOURCE varchar(1) DEFAULT NULL,
  IMG_NUM_F varchar(20) DEFAULT NULL,
  IMG_NUM_B varchar(20) DEFAULT NULL,
  IS_IMG_NEW bit(1) DEFAULT NULL,
  FALSE_POSITIVE varchar(200) DEFAULT NULL,
  MRLN_ENABLED bit(1) DEFAULT '0',
  MRLN_TEST_ABORTED bit(1) DEFAULT NULL,
  MRLN_PASS_PERCENT float DEFAULT NULL,
  MRLN_TAG varchar(10) DEFAULT NULL,
  MATCH_BACK_CODE varchar(320) DEFAULT NULL,
  ADDR_BLOCK_IMB varchar(40) DEFAULT NULL,
  STD_USPS_ADDR varchar(100) DEFAULT NULL,
  FIRM_NAME varchar(100) DEFAULT NULL,
  MS_MAIL_TYPE_ID int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS mail_run;
CREATE TABLE mail_run (
  RUN_ID int(11) NOT NULL primary key,
  SORT_MODE_ID int(11) NOT NULL,
  SM_RUN_ID int(11) DEFAULT NULL,
  SEGMENT_ID int(11) NOT NULL,
  START_TIME datetime DEFAULT NULL,
  SHIFT_ID int(11) DEFAULT NULL,
  END_TIME datetime DEFAULT NULL,
  TOTAL_FED int(11) DEFAULT NULL,
  TOTAL_SORTED int(11) DEFAULT NULL,
  TOTAL_REJECTED int(11) DEFAULT NULL,
  DATE_ZIP_4_DB varchar(100) DEFAULT NULL,
  TRANSFER_ID int(11) DEFAULT NULL,
  STG_SEQUENCE_NUM bigint(20) DEFAULT NULL,
  NCOA_RUN_ID varchar(32) DEFAULT NULL,
  NCOA_PSR blob,
  USER_ID int(11) DEFAULT NULL
);








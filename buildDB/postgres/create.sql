-- -------------------------------------------------------------------------------
--
-- Create the zgICU tables
--
-- -------------------------------------------------------------------------------

--------------------------------------------------------
--  File created -2022-03-09
--------------------------------------------------------

-- If running scripts individually, you can set the schema where all tables are created as follows:
-- SET search_path TO zgicu1.0;
-- Restoring the search path to its default value can be accomplished as follows:
--  SET search_path TO "$user",public;

/* 
*/


DROP SCHEMA IF EXISTS zgICU1_0 CASCADE;
CREATE SCHEMA zgICU1_0;

--------------------------------------------------------
-- Table BASELINE (dtBaseline.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.BASELINE CASCADE;
CREATE TABLE zgICU1_0.BASELINE
(
  ROW_ID INT NOT NULL,
  PATIENT_ID INT NOT NULL,
  INP_NO INT NOT NULL,
  AGE INT,
  SEX VARCHAR(10) NOT NULL,
  AdmitDept  VARCHAR(100) NOT NULL,
  InfectionSite VARCHAR(50) NOT NULL,
  ICU_discharge_time DOUBLE PRECISION,
  discharge_date_time DOUBLE PRECISION,
  CONSTRAINT baseline_rowid_pk PRIMARY KEY (ROW_ID),
  CONSTRAINT baseline_patient_unique UNIQUE (PATIENT_ID)
);

--------------------------------------------------------
--  Table TRANSFER (dtTransfer.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.TRANSFER CASCADE;
CREATE TABLE zgICU1_0.TRANSFER
(
  ROW_ID INT NOT NULL,
  PATIENT_ID INT NOT NULL,
  INP_NO INT NOT NULL,
  StartTime DOUBLE PRECISION,
  StopTime DOUBLE PRECISION,
  StartReason VARCHAR(100) NOT NULL,
  StopReason VARCHAR(100) NOT NULL,
  TransferDept VARCHAR(75) NOT NULL,
  CONSTRAINT transfer_rowid_pk PRIMARY KEY (ROW_ID)
);

--------------------------------------------------------
--  Table OUTCOME (dtOutcome.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.OUTCOME CASCADE;
CREATE TABLE zgICU1_0.OUTCOME
(
  ROW_ID INT NOT NULL,
  PATIENT_ID  INT NOT NULL,
  Follow_Date DOUBLE PRECISION,
  Follow_Vital VARCHAR(5),
  Death_Date DOUBLE PRECISION,
  SF36_GeneralHeath VARCHAR(20),
  SF36_GH_SickerEasierThanOthers VARCHAR(20),
  SF36_GH_HeathyasOthers VARCHAR(20),
  SF36_GH_GetWorse VARCHAR(20),
  SF36_GH_ExcellentHealth VARCHAR(20),
  SF36_ActivityLimit_VigorousActivity VARCHAR(20),
  SF36_ActivityLimit_ModerateActivity VARCHAR(20),
  SF36_ActivityLimit_LiftingGroceries  VARCHAR(20),
  SF36_ActivityLimit_ClimingSeveralFlights VARCHAR(20), 
  SF36_ActivityLimit_ClimingOneFlight VARCHAR(20),
  SF36_ActivityLimit_BendingKneelStoop VARCHAR(20),
  SF36_ActivityLimit_WalkingMore1500M VARCHAR(20),
  SF36_ActivityLimit_Walking1000M  VARCHAR(20),
  SF36_ActivityLimit_Walking100M VARCHAR(20),
  SF36_ActivityLimit_BathingDressing VARCHAR(20),
  SF36_Pain_BodyPainPast4wk VARCHAR(15),
  SF36_Pain_BodyPainPast4wkInterHousework VARCHAR(15),
  SF36_PhysicalHeath_CutWork VARCHAR(10),
  SF36_PhysicalHeath_AccomplishLess VARCHAR(10),
  SF36_PhysicalHeath_LimitedWork VARCHAR(10),
  SF36_PhysicalHeath_DiffiPerformingWork VARCHAR(10),
  SF36_Emotional_Nervous VARCHAR(25),
  SF36_Emotional_DownNothingCheer VARCHAR(25),
  SF36_Emotional_Calm VARCHAR(25),
  SF36_Emotional_DownHearted VARCHAR(25),
  SF36_Emotional_HappyPerson VARCHAR(25),
  SF36_Emotional_aLotEnergy VARCHAR(25),
  SF36_Emotional_FullPep VARCHAR(25),
  SF36_Emotional_WornOut VARCHAR(25),
  SF36_Emotional_Tired VARCHAR(25),
  SF36_4wksSocialActivityEmotionOrPhysical VARCHAR(25),
  SF36_NoInfSocialActivity VARCHAR(25),
  SF36_ReducedTime4wksSocialActivityEmotion VARCHAR(25),
  SF36_ReducedAmount4wksSocialActivityEmotion VARCHAR(5),
  SF36_ReducedQuality4wksSocialActivityEmotion VARCHAR(5),
  SF36_OneYearCompareHealthCondition VARCHAR(50),
  Discharge_Dept VARCHAR(100) NOT NULL,
  CONSTRAINT outcome_rowid_pk  PRIMARY KEY (ROW_ID),
  CONSTRAINT outcome_patient_unique UNIQUE (PATIENT_ID)
);

--------------------------------------------------------
--  Table LAB (dtLab.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.LAB CASCADE;
CREATE TABLE zgICU1_0.LAB
(
  ROW_ID INT NOT NULL,
  INP_NO INT NOT NULL,
  LabTime DOUBLE PRECISION,
  Category VARCHAR(50),
  Item VARCHAR(100),
  LabValue VARCHAR(20),
  Unit VARCHAR(20),
  Ref VARCHAR(20),
  CONSTRAINT lab_rowid_pk PRIMARY KEY (ROW_ID)
);

--------------------------------------------------------
--  Table DRUGS (dtDrugs.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.DRUGS CASCADE;
CREATE TABLE zgICU1_0.DRUGS
(
  ROW_ID INT NOT NULL,
  PATIENT_ID INT NOT NULL,
  DrugName VARCHAR(100),
  Drug_time DOUBLE PRECISION,
  Formula VARCHAR(50),
  CONSTRAINT drug_rowid_pk PRIMARY KEY (ROW_ID)
);

--------------------------------------------------------
--  Table NURSINGCHART (dtNursingChart.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.NURSINGCHART CASCADE;
CREATE TABLE zgICU1_0.NURSINGCHART
(
  ROW_ID INT NOT NULL,
  INP_NO INT,
  temperature DOUBLE PRECISION, 
  heart_rate DOUBLE PRECISION,
  breathing SMALLINT,
  Rhythm VARCHAR(5),
  Blood_oxygen_saturation DOUBLE PRECISION,
  Blood_pressure_high DOUBLE PRECISION,
  Blood_pressure_low DOUBLE PRECISION,
  Lower_extremity_blood_pressure_monitoring VARCHAR(5),
  Invasive_SBP DOUBLE PRECISION,
  Invasive_SBP_1 DOUBLE PRECISION,
  Invasive_diastolic_blood_pressure DOUBLE PRECISION,
  Central_venous_pressure DOUBLE PRECISION,
  blood_sugar DOUBLE PRECISION,
  Oxygen_inhalation_mode VARCHAR(25),
  Oxygen_flow VARCHAR(5),
  MAP VARCHAR(5),
  Breathing_pattern VARCHAR(25),
  F INT,
  Vt_setting SMALLINT,
  PSIPAP VARCHAR(10),
  R VARCHAR(10),
  FIO2 VARCHAR(10),
  Vt_Supervisor DOUBLE PRECISION,
  consciousness VARCHAR(10),
  Left_pupil_size VARCHAR(10),
  Right_pupil_size VARCHAR(10),
  Left_pupil_reflex VARCHAR(5),
  Right_pupil_reflex VARCHAR(5),
  open_ones_eyes VARCHAR(25),
  motion VARCHAR(10),
  language VARCHAR(10),
  CVC VARCHAR(10),
  PICC VARCHAR(5),
  Endotracheal_intubation VARCHAR(5),
  Gastric_tube VARCHAR(5),
  Medium_length_catheter VARCHAR(5),
  Hemodialysis_tube VARCHAR(5),
  basic_nursing VARCHAR(100),
  Skin_care VARCHAR(10),
  Acral_circulation VARCHAR(5),
  Pressure_ulcer_risk_assessment VARCHAR(5),
  Catheter_drop_assessment VARCHAR(10),
  Fall_bed_assessment VARCHAR(10),
  RASS_sedation_score VARCHAR(10),
  NRS_pain_score VARCHAR(10),
  Cpot_pain_score VARCHAR(5),
  Airbag_pressure VARCHAR(25),
  ETCO2 VARCHAR(5),
  milk SMALLINT,
  rice SMALLINT,
  Rice_noodles SMALLINT,
  soup SMALLINT,
  traditional_Chinese_medicine SMALLINT,
  Soft_food SMALLINT,
  the_rice_soup SMALLINT,
  warm_water SMALLINT,
  fruit_juice SMALLINT,
  shit SMALLINT,
  Urine_volume DOUBLE PRECISION,
  gastric_juice DOUBLE PRECISION,
  Sputum_volume DOUBLE PRECISION,
  NURSING_DESC TEXT,
  Endotracheal_intubation_Depth VARCHAR(10),
  Extubation BOOL,
  ChartTime DOUBLE PRECISION,
  CONSTRAINT NURSINGCHART_rowid_pk PRIMARY KEY (ROW_ID)
);

--------------------------------------------------------
--  Table  ICD (dtICD.csv)
--------------------------------------------------------

DROP TABLE IF EXISTS zgICU1_0.ICD CASCADE;
CREATE TABLE zgICU1_0.ICD
(
  ROW_ID INT NOT NULL,
  INP_NO INT NOT NULL,
  PATIENT_ID INT NOT NULL,
  ICD_CODE VARCHAR(20),
  ICD_DESC TEXT,
  STATUS_DISCHARGE VARCHAR(10),
  DIAGNOSIS_SEQ SMALLINT,
  CONSTRAINT ICD_rowid_pk PRIMARY KEY (ROW_ID)
);
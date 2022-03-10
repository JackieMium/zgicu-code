-- -------------------------------------------------------------------------------
--
-- Load data into the zgICU1_0 schema
--
-- -------------------------------------------------------------------------------

--------------------------------------------------------
--  File created -2022-03-10
--------------------------------------------------------

/* Set the zgICU_data_dir variable to point to directory containing
   all .csv files.
*/
-- To run from a terminal:
--  psql "dbname=<DBNAME> user=<USER>" -v zgICU_data_dir=<PATH TO DATA DIR> -f load.sql
-- To run the script individually, you can set the schema where all tables are created as follows:
-- SET search_path TO zgicu1.0;
-- And you may have to comment out the following \cd line.
-- Change to the directory containing the data files
\cd :zgICU_data_dir
-- Restoring the search path to its default value can be accomplished as follows:
--  SET search_path TO "$user",public;


\COPY zgICU1_0.baseline FROM 'dtBaseline.csv' WITH(format csv, null 'NA', HEADER);
\COPY zgICU1_0.transfer FROM 'dtTransfer.csv' WITH(format csv, HEADER);
\COPY zgICU1_0.outcome FROM 'dtOutcome.csv' WITH(format csv, null 'NA',HEADER);
\COPY zgICU1_0.lab FROM 'dtLab.csv' WITH(format csv, HEADER);
\COPY zgICU1_0.drugs FROM 'dtDrugs.csv' WITH(format csv, HEADER);
\COPY zgICU1_0.nursingchart FROM 'dtNursingChart.csv' WITH(format csv, null 'NA', HEADER);
\COPY zgICU1_0.ICD FROM 'dtICD.csv' WITH(format csv, HEADER);

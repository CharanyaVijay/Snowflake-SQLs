list @LIKE_A_WINDOW_INTO_S3_BUCKET;

list @LIKE_A_WINDOW_INTO_S3_BUCKET/this_file.txt;
list @LIKE_A_WINDOW_INTO_S3_BUCKET/THIS_FILE.TXT;

create or replace table vegetable_details_soil_type
( plant_name varchar(25)
 ,soil_type number(1,0)
);

copy into vegetable_details_soil_type
from @LIKE_A_WINDOW_INTO_S3_BUCKET
files = ( 'VEG_NAME_TO_SOIL_TYPE_PIPE.txt')
file_format = ( format_name=PIPE_SEPARATOR );


create or replace table LU_SOIL_TYPE(
SOIL_TYPE_ID number,	
SOIL_TYPE varchar(15),
SOIL_DESCRIPTION varchar(75)
 );
 
 copy into LU_SOIL_TYPE
from @LIKE_A_WINDOW_INTO_S3_BUCKET
files = ( 'LU_SOIL_TYPE.tsv')
file_format = ( format_name=L8_CHALLENGE_FF);


SELECT * FROM LU_SOIL_TYPE;

CREATE OR REPLACE TABLE VEGETABLE_DETAILS_PLANT_HEIGHT(
PLANT_NAME VARCHAR(20),	
UOM varchar(2),
LOW_END NUMBER(2,0),
HIGH_END NUMBER(2,0)
 );
 
  copy into VEGETABLE_DETAILS_PLANT_HEIGHT
from @LIKE_A_WINDOW_INTO_S3_BUCKET
files = ( 'veg_plant_height.csv')
file_format = ( format_name=COMMA_SEPARATOR);


use role sysadmin;
create or replace table GARDEN_PLANTS.VEGGIES.ROOT_DEPTH (
   ROOT_DEPTH_ID number(1), 
   ROOT_DEPTH_CODE text(1), 
   ROOT_DEPTH_NAME text(7), 
   UNIT_OF_MEASURE text(2),
   RANGE_MIN number(2),
   RANGE_MAX number(2)
   ); 
   
   
   
   INSERT INTO ROOT_DEPTH (
	ROOT_DEPTH_ID ,
	ROOT_DEPTH_CODE ,
	ROOT_DEPTH_NAME ,
	UNIT_OF_MEASURE ,
	RANGE_MIN ,
	RANGE_MAX 
)

VALUES
(
    3,
    'D',
    'Deep',
    'cm',
    60,
    90
)
;

select * from root_depth; 


create table vegetable_details
(
plant_name varchar(25)
, root_depth_code varchar(1)    
);

SELECT * FROM vegetable_details
WHERE PLANT_NAME='Spinach';

delete  FROM vegetable_details
WHERE PLANT_NAME='Spinach'
and root_depth_code='D'

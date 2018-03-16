CREATE OR REPLACE FORCE VIEW "VW_SSA_SUB_VARIABLE" ("HEADER_TEXT", "GOOGLE_LINK", "WOW_WORKING") AS
  SELECT
'<h1> this is my text </h1>' as Header_Text,
'<a href=''google.com''>google</a>' as google_link,
'<p>wow this is really working</p>' as wow_working
FROM dual


/*
Create new html content:
CREATE OR REPLACE FORCE VIEW  "VW_DANB_SSA" ("HEADER_TEXT", "GOOGLE_LINK","WOW_WORKING") AS
  SELECT
'<h1> this is my text </h1>' as Header_Text,
'<a href=''google.com''>google</a>' as google_link,
--last line does not have a comma
'<p>wow this is really working</p>' as wow_working
FROM dual

concantenate:
SELECT header_text || ' ' || google_link as combined_html FROM acgidata.VW_DANB_SSA_HEADER


SELECT * FROM VW_SSA_SUB_VARIABLE*/

This is a note keeping file to help with understanding how CF and DANB was able to create modules pertinent to their business process.


#### Access to Crystal 

Granting Access to VIEWS for Crystal Report 

Syntax: 
GRANT SELECT ON <name_of_view> TO <user>

exmaple
GRANT SELECT ON VW_DANB_CEN_CUST_CUSTOMER TO BUSOBJ
GRANT SELECT ON VW_DANB_CEN_CUST_CUSTOMER TO DANBRPT
GRANT SELECT ON VW_DANB_CEN_CUST_CUSTOMER TO DALERPT


We decided that we would follow a naming convention: Schema_Institution_Module_DataDescription, e.g. VW_DANB_EXM_EXAM


#### Schemas
- VW - views




#### Institution
- DANB - Dental Assisting National Board



#### Module
- CUST - Customer
- EXM - Exams
- SBM - Submitals


#### Data Description
- Exams -
- Attribute -
- Submittal -
- Customer -


#### Apex Page Number Designation
 - Customer Attributes 1000 - 1099
 - Certification Applications 1100 - 1199
 - Submitals 1200 - 1299
 -



###### to do's
- [x] did this work? cmonnnn
- [ ] clean up submittal views in Apex
- [ ] what is certification aps for 1100? Do we want to designate 1100 - 1199 for certification apps?


###### Helpful links:
- https://guides.github.com/features/mastering-markdown/
- https://www.gitkraken.com/
- https://www.sublimetext.com/
- https://atom.io/




I hope this helps.

Cheers,
DANB and CF Team

CREATE TABLE "USER9"."MICRO_ICU_DISTINCT_PATIENTS" 
AS 
(
SELECT	DISTINCT MEVE.SUBJECT_ID, 
		MEVE.HADM_ID, 
		ICDTL.ICUSTAY_ID
FROM "MIMIC2V26"."microbiologyevents" MEVE
INNER JOIN "MIMIC2V26"."d_codeditems" DI_O ON DI_O.ITEMID = MEVE.ORG_ITEMID
INNER JOIN "MIMIC2V26"."d_codeditems" DI_S ON DI_S.ITEMID = MEVE.SPEC_ITEMID
INNER JOIN "MIMIC2V26"."d_codeditems" DI_A ON DI_A.ITEMID = MEVE.AB_ITEMID
INNER JOIN "MIMIC2V26"."icustay_detail" ICDTL ON ICDTL.SUBJECT_ID = MEVE.SUBJECT_ID AND ICDTL.HADM_ID = MEVE.HADM_ID
WHERE 	DI_O.TYPE = 'MICROBIOLOGY'
AND 	DI_O.CATEGORY = 'ORGANISM'
AND		DI_S.TYPE = 'MICROBIOLOGY'
AND		DI_S.CATEGORY = 'SPECIMEN'
AND		DI_A.TYPE = 'MICROBIOLOGY'
AND		DI_A.CATEGORY = 'ANTIBACTERIUM'
AND		DI_O.LABEL IS NOT NULL
AND    	DI_S.LABEL = 'BLOOD CULTURE'
)
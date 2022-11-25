-- Ajout des données de test

-- Un utilisateur
INSERT INTO utilisateur VALUES (0, 'Monsieur Admin', 'admin@testtest.com', '6be5acef2c8c8d4cd877442112dd6c70793d3e570e403b209724f365cc061b0056507fde8b89e5645a3fd55aac34e63814067e7fe1cd5e69ff4b10d8fc24f329', '2020-05-12');

-- Cinq contacts
INSERT INTO contact VALUES (0, 'Chapdelaine', 'Marc', 1);
INSERT INTO contact VALUES (0, 'Pernoud', 'Julie', 1);
INSERT INTO contact VALUES (0, 'Chapuis', 'Hélène', 1);
INSERT INTO contact VALUES (0, 'Abdelnasser', 'Issa', 1);
INSERT INTO contact VALUES (0, 'McAlistair', 'Walter', 1);

-- Sept téléphones
INSERT INTO telephone VALUES (0, '5148754854', '252', 'Bureau', 3);
INSERT INTO telephone VALUES (0, '4508545870', '', 'Autre', 3);
INSERT INTO telephone VALUES (0, '4382521454', '', 'Cellulaire', 1);
INSERT INTO telephone VALUES (0, '5148745854', '10855', 'Bureau', 2);
INSERT INTO telephone VALUES (0, '4508521254', '', 'Domicile', 4);
INSERT INTO telephone VALUES (0, '5145212454', '', 'Autre', 5);
INSERT INTO telephone VALUES (0, '3369854545541', '1000', 'Bureau', 5);
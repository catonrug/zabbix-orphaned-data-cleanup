-- Delete orphaned alerts entries
SELECT * FROM alerts WHERE NOT actionid IN (SELECT actionid FROM actions);
SELECT * FROM alerts WHERE NOT eventid IN (SELECT eventid FROM events);
SELECT * FROM alerts WHERE NOT userid IN (SELECT userid FROM users);
SELECT * FROM alerts WHERE NOT mediatypeid IN (SELECT mediatypeid FROM media_type);

-- Delete orphaned application entries that no longer map back to a host
SELECT * FROM applications WHERE NOT hostid IN (SELECT hostid FROM hosts);

-- Delete orphaned auditlog details (such as logins)
SELECT * FROM auditlog_details WHERE NOT auditid IN (SELECT auditid FROM auditlog);
SELECT * FROM auditlog WHERE NOT userid IN (SELECT userid FROM users);

-- Delete orphaned conditions
SELECT * FROM conditions WHERE NOT actionid IN (SELECT actionid FROM actions);

-- Delete orphaned functions
SELECT * FROM functions WHERE NOT itemid IN (SELECT itemid FROM items);
SELECT * FROM functions WHERE NOT triggerid IN (SELECT triggerid FROM triggers);

-- Delete orphaned graph items
SELECT * FROM graphs_items WHERE NOT graphid IN (SELECT graphid FROM graphs);
SELECT * FROM graphs_items WHERE NOT itemid IN (SELECT itemid FROM items);

-- Delete orphaned host macro's
SELECT * FROM hostmacro WHERE NOT hostid IN (SELECT hostid FROM hosts);

-- Delete orphaned item data
SELECT * FROM items WHERE hostid NOT IN (SELECT hostid FROM hosts);
SELECT * FROM items_applications WHERE applicationid NOT IN (SELECT applicationid FROM applications);
SELECT * FROM items_applications WHERE itemid NOT IN (SELECT itemid FROM items);

-- Delete orphaned HTTP check data
SELECT * FROM httpstep WHERE NOT httptestid IN (SELECT httptestid FROM httptest);
SELECT * FROM httpstepitem WHERE NOT httpstepid IN (SELECT httpstepid FROM httpstep);
SELECT * FROM httpstepitem WHERE NOT itemid IN (SELECT itemid FROM items);
SELECT * FROM httptest WHERE applicationid NOT IN (SELECT applicationid FROM applications);

-- Delete orphaned maintenance data
SELECT * FROM maintenances_groups WHERE maintenanceid NOT IN (SELECT maintenanceid FROM maintenances);
SELECT * FROM maintenances_groups WHERE groupid NOT IN (SELECT groupid FROM groups);
SELECT * FROM maintenances_hosts WHERE maintenanceid NOT IN (SELECT maintenanceid FROM maintenances);
SELECT * FROM maintenances_hosts WHERE hostid NOT IN (SELECT hostid FROM hosts);
SELECT * FROM maintenances_windows WHERE maintenanceid NOT IN (SELECT maintenanceid FROM maintenances);
SELECT * FROM maintenances_windows WHERE timeperiodid NOT IN (SELECT timeperiodid FROM timeperiods);

-- Delete orphaned mappings
SELECT * FROM mappings WHERE NOT valuemapid IN (SELECT valuemapid FROM valuemaps);

-- Delete orphaned media items
SELECT * FROM media WHERE NOT userid IN (SELECT userid FROM users);
SELECT * FROM media WHERE NOT mediatypeid IN (SELECT mediatypeid FROM media_type);
SELECT * FROM rights WHERE NOT groupid IN (SELECT usrgrpid FROM usrgrp);
SELECT * FROM rights WHERE NOT id IN (SELECT groupid FROM groups);
SELECT * FROM sessions WHERE NOT userid IN (SELECT userid FROM users);

-- Screens
SELECT * FROM screens_items WHERE screenid NOT IN (SELECT screenid FROM screens);

-- Events & triggers
SELECT * FROM trigger_depends WHERE triggerid_down NOT IN (SELECT triggerid FROM triggers);
SELECT * FROM trigger_depends WHERE triggerid_up NOT IN (SELECT triggerid FROM triggers);

-- Delete records in the history/trends table where items that no longer exist
SELECT * FROM history WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT * FROM history_uint WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT * FROM history_log WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT * FROM history_str WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT * FROM history_text WHERE itemid NOT IN (SELECT itemid FROM items);

SELECT * FROM trends WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT * FROM trends_uint WHERE itemid NOT IN (SELECT itemid FROM items);

-- Delete records in the events table where triggers/items no longer exist
SELECT * FROM events WHERE source = 0 AND object = 0 AND objectid NOT IN (SELECT triggerid FROM triggers);
SELECT * FROM events WHERE source = 3 AND object = 0 AND objectid NOT IN (SELECT triggerid FROM triggers);
SELECT * FROM events WHERE source = 3 AND object = 4 AND objectid NOT IN (SELECT itemid FROM items);

-- Delete all orphaned acknowledge entries
SELECT * FROM acknowledges WHERE eventid NOT IN (SELECT eventid FROM events);
SELECT * FROM acknowledges WHERE userid NOT IN (SELECT userid FROM users);

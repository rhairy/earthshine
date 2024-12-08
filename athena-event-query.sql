/*
Retreives all S3 putobject events executed by IAM role earthshine-s3-object-creator in the last hour.
*/

SELECT useridentity, from_iso8601_timestamp(eventtime) AS iso8601, eventname, eventsource, requestparameters, resources
FROM cloudtrail_logs_aws_cloudtrail_logs_022499025674_8ea2cb9d
WHERE eventsource = 's3.amazonaws.com' AND eventname = 'PutObject' and useridentity.principalid LIKE '%earthshine-s3-object-creator' AND from_iso8601_timestamp(eventtime) > now() - interval '1' hour
ORDER BY iso8601 DESC;
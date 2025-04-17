-- Sample Code to move ahead if process is completed. Else to Check Again

WHILE (1=1)
BEGIN
    IF EXISTS (select * from #Employee where completed='Done')
        BEGIN
            PRINT 'Process Completed'
            BREAK;
        END
    PRINT'Process Still Not Completed'
    WAITFOR DELAY '00:01:30'
END

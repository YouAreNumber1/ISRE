using System;

namespace ISRE
{
    /// <summary>
    /// /////////// this is for update/insert
    /// </summary>
    public class ISRE_SESSION_SCH
    {
            public string SESS_SEQ_NO { get; set; }
            public string SCH_ORDER        { get; set; }
            public DateTime SCH_DATE_S  { get; set; }
           
            public DateTime SCH_DATE_E        { get; set; }
           
            public string SCH_CONTENT { get; set; }
            public DateTime TXT_DATE        { get; set; }
            public string TXT_USER_ID { get; set; }
         

    }
}
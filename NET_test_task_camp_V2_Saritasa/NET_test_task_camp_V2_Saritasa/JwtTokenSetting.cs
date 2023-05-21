namespace NET_test_task_camp_V2_Saritasa
{
    public class JwtTokenSetting
    {
        public string SecretKey { get; set; }
        public string Issuer { get; set; }
        public int ExpiryMinutes { get; set; }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        var app = WebApplication.Create(args);

        var nowMst = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Mountain Standard Time"));

        app.MapGet("/", () => $"{nowMst:MM/dd/yyyy hh:mm:ss tt}: Hello from App1.");

        app.Run("http://+:5000");
    }
}
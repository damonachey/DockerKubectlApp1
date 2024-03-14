public class Program
{
    public static void Main(string[] args)
    {
        var app = WebApplication.Create(args);

        app.MapGet("/", () => "Hello from App1.");

        app.Run("http://+:5000");
    }
}
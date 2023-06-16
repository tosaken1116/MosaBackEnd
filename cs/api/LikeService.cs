using System.Data;
using Npgsql;
using System.Threading.Tasks;

public class LikeService
{
    private static string Host = Environment.GetEnvironmentVariable("POSTGRES_HOST");
    private static string User = Environment.GetEnvironmentVariable("POSTGRES_USER");
    private static string DBname = Environment.GetEnvironmentVariable("POSTGRES_DB");
    private static string Password = Environment.GetEnvironmentVariable("POSTGRES_PASSWORD");
    private static string Port = Environment.GetEnvironmentVariable("POSTGRES_PORT");
    private readonly string _connectionString = String.Format(
            "Server={0};Username={1};Database={2};Port={3};Password={4};SSLMode=Prefer",
            Host,
            User,
            DBname,
            Port,
            Password);

    public async Task<Like> AddLikeAsync(Like like)
    {
        using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        using var cmd = new NpgsqlCommand("INSERT INTO likes(user_id, post_id) VALUES (@userId, @PostId::uuid) RETURNING *;", conn);
        cmd.Parameters.AddWithValue("userId", like.UserId);
        cmd.Parameters.AddWithValue("postId", like.PostId);

        using var reader = await cmd.ExecuteReaderAsync(CommandBehavior.SingleRow);
        await reader.ReadAsync();

        return new Like
        {
            UserId = reader.GetString(1),
            PostId = reader.GetGuid(0)
        };
    }
}

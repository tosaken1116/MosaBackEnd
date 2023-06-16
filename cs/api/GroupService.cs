using System.Data;
using Npgsql;
using System.Threading.Tasks;

public class GroupService
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

    public async Task<Group> AddGroupAsync(Group group)
    {
        using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        using var cmd = new NpgsqlCommand("INSERT INTO users_groups (user_id, group_id) VALUES (@userId, @groupId::uuid) RETURNING *;", conn);
        cmd.Parameters.AddWithValue("userId", group.UserId);
        cmd.Parameters.AddWithValue("groupId", group.GroupId);

        using var reader = await cmd.ExecuteReaderAsync(CommandBehavior.SingleRow);
        await reader.ReadAsync();

        return new Group
        {
            UserId = reader.GetString(0),
            GroupId = reader.GetGuid(1)
        };
    }
}
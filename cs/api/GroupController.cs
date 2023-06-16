using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("[controller]")]
public class GroupController : ControllerBase
{
    private readonly GroupService _groupService;

    public GroupController(GroupService groupService)
    {
        _groupService = groupService;
    }

    [HttpPost]
    public async Task<IActionResult> PostGroup([FromBody] Group group)
    {
        var addedLike = await _groupService.AddGroupAsync(group);
        return Ok(addedLike);
    }
}

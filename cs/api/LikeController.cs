using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("[controller]")]
public class LikesController : ControllerBase
{
    private readonly LikeService _likeService;

    public LikesController(LikeService likeService)
    {
        _likeService = likeService;
    }

    [HttpPost]
    public async Task<IActionResult> PostLike([FromBody] Like like)
    {
        var addedLike = await _likeService.AddLikeAsync(like);
        return Ok(addedLike);
    }
}

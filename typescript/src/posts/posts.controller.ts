import { Body, Controller, Get, Post } from '@nestjs/common';
import { PostsService } from './posts.service';
import { posts } from '@prisma/client';

@Controller('posts')
export class PostsController {
  constructor(private readonly postsService: PostsService) {}

  @Get()
  async posts(): Promise<posts[]> {
    return this.postsService.posts();
  }

  @Post('/following')
  async following(@Body() userData: { user_id: string }): Promise<posts[]> {
    return this.postsService.followingPosts(userData.user_id);
  }
}

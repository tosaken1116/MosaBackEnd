import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { posts } from '@prisma/client';

@Injectable()
export class PostsService {
  constructor(private prisma: PrismaService) {}

  async posts(): Promise<posts[]> {
    return this.prisma.posts.findMany({
      include: {
        users: true,
        likes: true,
        replies: true,
      },
    });
  }

  async followingPosts(userId: string): Promise<posts[]> {
    const followingUsers = await this.prisma.following.findMany({
      where: {
        user_id: userId,
      },
      select: {
        target_id: true,
      },
    });

    const followingUserIds = followingUsers.map((user) => user.target_id);

    return this.prisma.posts.findMany({
      where: {
        user_id: {
          in: followingUserIds,
        },
      },
      include: {
        likes: true,
        replies: true,
      },
    });
  }
}

import { Injectable } from '@nestjs/common';
import { rooms } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class RoomsService {
  constructor(private prisma: PrismaService) {}

  async getAvailableRooms(userId: string): Promise<rooms[]> {
    const userGroups = await this.prisma.users_groups.findMany({
      where: {
        user_id: userId,
      },
    });
    const userGroupIds = userGroups.map((group) => group.group_id);

    const rooms = await this.prisma.rooms.findMany({
      where: {
        OR: [
          {
            is_public: true,
          },
          {
            is_public: false,
            group_id: {
              in: userGroupIds,
            },
          },
        ],
        end_time: {
          gt: new Date(),
        },
      },
      orderBy: {
        start_time: 'asc',
      },
    });

    return rooms;
  }
}

import { Body, Controller, Post } from '@nestjs/common';
import { RoomsService } from './rooms.service';
import { rooms } from '@prisma/client';

@Controller('rooms')
export class RoomsController {
  constructor(private readonly roomsService: RoomsService) {}

  @Post('')
  async following(@Body() userData: { user_id: string }): Promise<rooms[]> {
    return this.roomsService.getAvailableRooms(userData.user_id);
  }
}

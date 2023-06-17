import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PostsService } from './posts/posts.service';
import { PostsController } from './posts/posts.controller';
import { PostsModule } from './posts/posts.module';
import { PrismaService } from './prisma.service';
import { RoomsService } from './rooms/rooms.service';
import { RoomsController } from './rooms/rooms.controller';
import { RoomsModule } from './rooms/rooms.module';

@Module({
  imports: [PostsModule, RoomsModule],
  controllers: [AppController, PostsController, RoomsController],
  providers: [AppService, PostsService, PrismaService, RoomsService],
})
export class AppModule {}

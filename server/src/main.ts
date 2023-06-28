import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
  console.log('\x1b[32mServer run at:\x1b[0m http://localhost:3000');
}

bootstrap();

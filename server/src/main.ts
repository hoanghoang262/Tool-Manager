import { NestFactory } from '@nestjs/core';
import { DocumentBuilder } from '@nestjs/swagger';
import { SwaggerModule } from '@nestjs/swagger/dist';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { env } from 'process';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const PORT: number = parseInt(env.APP_PORT);

  //Setup ValidationPipe globally
  app.useGlobalPipes(new ValidationPipe());

  //Swapper config object
  const config = new DocumentBuilder()
    .setTitle('Manager Tool')
    .setDescription('The Manager Tool description')
    .setVersion('0.1')
    .build();

  //Init swapper page in '/api' paths
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  await app.listen(PORT | 3000);
}
bootstrap();

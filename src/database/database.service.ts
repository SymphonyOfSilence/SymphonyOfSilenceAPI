import { Injectable, OnModuleInit, OnModuleDestroy } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class DatabaseService extends PrismaClient implements OnModuleInit, OnModuleDestroy {
    async onModuleInit(): Promise<void> {
        await (this.$connect as () => Promise<void>)();
        console.log('✅ Database connected successfully!');
    }

    async onModuleDestroy(): Promise<void> {
        await (this.$disconnect as () => Promise<void>)();
    }
}


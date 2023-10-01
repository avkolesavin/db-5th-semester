import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { GuideCategory } from './guide-category';
import { TouristCategory } from './tourist-category';

@Entity()
export class RouteDifficulty {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('text', { nullable: true })
    description?: string;

    @ManyToOne(() => GuideCategory)
    minGuideCategory: GuideCategory;

    @ManyToOne(() => TouristCategory)
    minTouristCategory: TouristCategory;
}

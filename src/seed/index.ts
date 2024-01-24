import { DataSource } from 'typeorm';

import { seasons, touristsCategories, guidesCategories, equipmentTypes, equipment } from './static';

import { Season } from '../entity/season';
import { TouristCategory } from '../entity/tourist-category';
import { GuideCategory } from '../entity/guide-category';
import { EquipmentType } from '../entity/equipment-type';
import { Equipment } from '../entity/equipment';

export const seed = async (ds: DataSource) => {
    const seasonsRep = ds.getRepository(Season);
    const touristCategoryRep = ds.getRepository(TouristCategory);
    const guideCategoryRep = ds.getRepository(GuideCategory);
    const equipmentTypeRep = ds.getRepository(EquipmentType);
    const equipmentRep = ds.getRepository(Equipment);

    // insert static
    await seasonsRep.insert(seasons);
    await touristCategoryRep.insert(touristsCategories);
    await guideCategoryRep.insert(guidesCategories);
    await equipmentTypeRep.insert(equipmentTypes);
    await equipmentRep.insert(equipment);
};

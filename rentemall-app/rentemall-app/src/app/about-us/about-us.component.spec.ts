import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { About-usComponent } from './about-us.component';

describe('About-usComponent', () => {
  let component: About-usComponent;
  let fixture: ComponentFixture<About-usComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ About-usComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(About-usComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

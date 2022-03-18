import React from 'react';
import { requireNativeComponent } from 'react-native';

type UnityPlayTsProps = {};

const ComponentName = 'UnityPlayTsView';

const UnityPlayTsView = requireNativeComponent<UnityPlayTsProps>(ComponentName);

export default class UnityPlayView extends React.Component<UnityPlayTsProps> {
  static defaultProps = {};

  constructor(props: any) {
    super(props);
  }

  private getProps() {
    return {
      ...this.props,
    };
  }

  public render() {
    return <UnityPlayTsView {...this.getProps()} />;
  }
}
